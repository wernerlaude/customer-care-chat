class ChatSession < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :session_id, presence: true, uniqueness: true

  def self.find_or_create_for_session(session_id)
    find_or_create_by(session_id: session_id)
  end

  def last_message
    messages.order(:created_at).last
  end
end