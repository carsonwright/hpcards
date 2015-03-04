class CreateGameDecks < ActiveRecord::Migration
  def change
    create_table :game_decks do |t|
      t.integer :game_id
      t.integer :deck_id
      t.integer :card_id

      t.timestamps null: false
    end
  end
end
