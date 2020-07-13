class ChangeColumnsFromConversations < ActiveRecord::Migration[6.0]
  def change
    remove_column :conversations, :starter_id, :integer
    add_reference :conversations, :user, null: false, foreign_key: true
  end
end
