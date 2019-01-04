class CreateBandPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :band_photos do |t|
      t.integer :user_id
      t.text :intro
      t.json :images

      t.timestamps
    end
  end
end
