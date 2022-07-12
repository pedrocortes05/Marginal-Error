class CreateMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :maps do |t|
      t.integer :row
      t.integer :col

      t.timestamps
    end
  end
end
