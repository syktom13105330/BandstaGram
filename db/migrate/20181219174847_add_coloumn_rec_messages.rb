class AddColoumnRecMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :rec_messages, :status, :string
  end
end
