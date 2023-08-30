class AddCoordToOvens < ActiveRecord::Migration[7.0]
  def change
    add_column :ovens, :latitude, :float
    add_column :ovens, :longitude, :float
  end
end
