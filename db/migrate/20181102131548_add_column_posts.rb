class AddColumnPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :file_type, :string
    add_column :posts, :file_name, :string
  end
end
