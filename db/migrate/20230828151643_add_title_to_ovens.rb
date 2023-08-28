class AddTitleToOvens < ActiveRecord::Migration[7.0]
  def change
    add_column :ovens, :title, :string
  end
end
