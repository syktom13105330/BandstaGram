class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :c_name
      t.string :a_name

      t.timestamps
    end
  end
end
