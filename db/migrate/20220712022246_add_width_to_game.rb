class AddWidthToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :width, :integer
  end
end
