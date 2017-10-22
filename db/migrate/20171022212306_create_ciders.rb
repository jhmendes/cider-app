class CreateCiders < ActiveRecord::Migration[5.1]
  def change
    create_table :ciders do |t|

      t.timestamps
    end
  end
end
