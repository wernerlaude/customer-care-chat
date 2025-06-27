class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  protect_from_forgery with: :exception

  private

  def current_chat_session
    session_id = session.id.to_s
    @current_chat_session ||= ChatSession.find_or_create_for_session(session_id)
  end

  helper_method :current_chat_session
end
