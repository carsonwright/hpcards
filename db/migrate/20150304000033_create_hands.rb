class CreateHands < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.integer :user_id
      t.integer :card_id
      t.integer :game_id

      t.timestamps null: false
    end
  end
end
