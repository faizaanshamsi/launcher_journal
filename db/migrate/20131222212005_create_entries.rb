class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :category_id

      t.timestamps
    end
  end
end
