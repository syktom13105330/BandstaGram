class CreateRecMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :rec_messages do |t|
      t.text       :content
      t.integer    :user_id
      t.integer    :rec_room_id

      t.timestamps
    end
  end
end
