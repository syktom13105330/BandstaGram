class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.text :content
      t.json :images
      t.timestamps
    end
  end
end
