class CreateRecEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :rec_entries do |t|

      t.integer    :user_id
      t.integer    :rec_room_id


      t.timestamps
    end
  end
end
