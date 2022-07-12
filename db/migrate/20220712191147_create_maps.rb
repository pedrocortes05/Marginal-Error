class CreateMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :maps, id: false do |t|
      t.integer :row
      t.integer :col
      t.references :value, references: :players, foreign_key: { to_table: :players }
      t.index [:row, :col], unique: true
    end
  end
end
