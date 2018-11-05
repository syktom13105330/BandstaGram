class RemoveColumnPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :writer_type
    remove_column :posts, :file_type
    remove_column :posts, :file_name
  end
end
