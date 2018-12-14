class AddcolumnAppMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :app_messages, :status, :string
  end
end
