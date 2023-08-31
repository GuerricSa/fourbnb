class CreateTableReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :content
      t.references :booking, foreign_key: true
      t.timestamps
    end
  end
end
