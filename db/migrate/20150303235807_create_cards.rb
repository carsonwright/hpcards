class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.string :attr_one
      t.string :attr_two
      t.string :attr_three
      t.string :attr_four
      t.string :attr_five
      t.string :attr_six
      t.text :attr_description
      t.integer :deck_id

      t.timestamps null: false
    end
  end
end
