class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.integer :user_id
      t.text :intro
      t.json :medias

      t.timestamps
    end
  end
end
