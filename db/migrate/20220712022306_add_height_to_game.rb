class AddHeightToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :height, :integer
  end
end
