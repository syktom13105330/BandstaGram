class RenameMediaColumnToMedia < ActiveRecord::Migration[5.2]
  def change
    rename_column :media, :medias, :media
  end
end
