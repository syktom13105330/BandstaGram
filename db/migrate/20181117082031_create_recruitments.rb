class CreateRecruitments < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitments do |t|
      t.integer :band_id
      t.text :r_info
      t.date :expired
      t.string :part
      t.string :gender
      t.string :area

      t.timestamps
    end
  end
end
