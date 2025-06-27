class Admin::ChatSessionsController < ApplicationController
  def index
    @chat_sessions = ChatSession.includes(:messages).order(updated_at: :desc)
  end

  def show
    @chat_session = ChatSession.find(params[:id])
    @messages = @chat_session.messages.order(:created_at)
  end
end