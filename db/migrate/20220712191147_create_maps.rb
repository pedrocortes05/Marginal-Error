class CreateMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :maps, id: false do |t|
      t.integer :row
      t.integer :col
      t.reference :player
    end

    add_index :maps, [:row, :col], unique: true
  end
end
