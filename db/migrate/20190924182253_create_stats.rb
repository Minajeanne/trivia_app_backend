class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.integer "user_id"
      t.integer "total_correct"
      t.integer "user_pr"
      t.integer "user_rank"

      t.timestamps
    end
  end
end
