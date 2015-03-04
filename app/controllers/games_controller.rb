class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :pick_up, :put_back, :shuffle]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @current_cards = Array.new
    Deck.all.each do |deck|
      card = GameDeck.where(deck_id: deck.id, game_id: @game.id).first
      if card
        card = Card.find_by(id: card.card_id)
        if card
         @current_cards.push(card)
       end
      end
    end

    card_ids = Hand.where(game_id: @game.id, user_id: current_user.id ).collect(&:card_id)
    @your_cards = Card.where(id: card_ids)
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    cards = Hash.new



    respond_to do |format|
      if @game.save
        Deck.all.each do |deck|
          deck.cards.shuffle.each do |card|
            GameDeck.create(deck_id: deck.id, card_id: card.id, game_id: @game.id)
          end
        end
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def shuffle
    GameDeck.where(game_id: @game.id).destroy_all

    Deck.all.each do |deck|
      deck.cards.shuffle.each do |card|
        GameDeck.create(deck_id: deck.id, card_id: card.id, game_id: @game.id)
      end
    end
    
    redirect_to root_path
  end

  def put_back
    Hand.find_by(game_id: @game.id, card_id: params[:card_id], user_id: current_user.id).destroy
    GameDeck.create(game_id: @game.id, deck_id: Card.find_by(id: params[:card_id]).deck_id, card_id: params[:card_id])
    redirect_to game_path(@game)
  end

  def pick_up
    Hand.create(game_id: @game.id, card_id: params[:card_id], user_id: current_user.id)
    GameDeck.find_by(game_id: @game.id, card_id: params[:card_id]).destroy
    redirect_to game_path(@game)
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name)
    end
end
