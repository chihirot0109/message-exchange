class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.integer :starter
      t.integer :recipient

      t.timestamps
    end
  end
end
