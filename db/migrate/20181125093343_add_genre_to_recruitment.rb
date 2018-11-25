class AddGenreToRecruitment < ActiveRecord::Migration[5.2]
  def change
    add_column :recruitments, :genre, :string
  end
end
