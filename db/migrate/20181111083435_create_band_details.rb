class CreateBandDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :band_details do |t|
      t.integer :user_id
      t.string :file_type
      t.string :file_name
      t.string :string
      t.text :file_exp

      t.timestamps
    end
  end
end
