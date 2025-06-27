class Message < ApplicationRecord
  belongs_to :chat_session

  validates :content, presence: true
  validates :sender_type, inclusion: { in: %w[visitor assistant] }

  def from_visitor?
    sender_type == 'visitor'
  end

  def from_assistant?
    sender_type == 'assistant'
  end
end