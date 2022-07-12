class DropMapTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :maps
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
