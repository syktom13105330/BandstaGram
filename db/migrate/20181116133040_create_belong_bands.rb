class CreateBelongBands < ActiveRecord::Migration[5.2]
  def change
    create_table :belong_bands do |t|
      t.integer :user_id
      t.integer :band_id

      t.timestamps
    end
  end
end
