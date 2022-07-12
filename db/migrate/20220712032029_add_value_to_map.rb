class AddValueToMap < ActiveRecord::Migration[7.0]
  def change
    add_column :maps, :value, :integer
  end
end
