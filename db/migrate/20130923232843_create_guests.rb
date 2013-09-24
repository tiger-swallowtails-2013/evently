class CreateGuests < ActiveRecord::Migration
  def up
    create_table :guests do |t|
      t.string :name
      t.string :email
      t.boolean :rsvp?
      t.references :event
      t.timestamps
    end
  end

  def down
    drop_table :guests
  end
end
