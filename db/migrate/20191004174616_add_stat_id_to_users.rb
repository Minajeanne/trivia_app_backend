class AddStatIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :stat_id, :integer
  end
end
