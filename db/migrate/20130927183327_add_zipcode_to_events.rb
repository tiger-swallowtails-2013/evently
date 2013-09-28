class AddZipcodeToEvents < ActiveRecord::Migration
  def up
    add_column :events, :zipcode, :integer
  end

  def down
    remove_column :events, :zipcode
  end
end
