class AddUserToEvents < ActiveRecord::Migration
  def up
    add_column :events, :user_id, :integer
  end

  def down
    remove_column :events, :user_id
  end
end
