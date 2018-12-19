class AddColumnRecEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :rec_entries, :recruitment_id, :integer
  end
end
