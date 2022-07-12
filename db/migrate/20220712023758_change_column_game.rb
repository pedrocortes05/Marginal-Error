class ChangeColumnGame < ActiveRecord::Migration[7.0]
  def change
    change_table :games do |t|
      t.change :created_at, :datetime, after: :height
      t.change :updated_at, :datetime, after: :created_at
    end
  end
end
