class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.references :chat_session, null: false, foreign_key: true
      t.text :content, null: false
      t.string :sender_type, null: false # 'visitor' oder 'assistant'
      t.timestamps
    end

    add_index :messages, [:chat_session_id, :created_at]
  end
end