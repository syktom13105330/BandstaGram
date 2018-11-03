class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :writer_id
      t.string :writer_type
      t.text :content
      t.string :private_flag

      t.timestamps
    end
  end
end
