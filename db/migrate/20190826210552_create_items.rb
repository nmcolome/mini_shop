class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.string :image
      t.integer :status, default: 0
      t.integer :inventory
      t.references :merchant, foreign_key: true

      t.timestamps
    end
  end
end
