class CreateChatSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :chat_sessions do |t|
      t.string :session_id, null: false
      t.string :visitor_name
      t.string :status, default: 'active'
      t.timestamps
    end

    add_index :chat_sessions, :session_id, unique: true
  end
end