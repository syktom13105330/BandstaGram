class AddColumnRecRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rec_rooms, :recruitment_id, :integer
  end
end
