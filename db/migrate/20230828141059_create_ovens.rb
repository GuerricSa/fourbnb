class CreateOvens < ActiveRecord::Migration[7.0]
  def change
    create_table :ovens do |t|
      t.string :brand
      t.text :address
      t.text :description
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
