class AddColumnsToCiderTable < ActiveRecord::Migration[5.1]
  def change
    add_column :ciders, :company, :string, null: false
    add_column :ciders, :style, :string, null: false
    add_column :ciders, :abv, :string, null: false
    add_column :ciders, :season, :string, null: false
    add_column :ciders, :description, :string, null: false
  end
end
