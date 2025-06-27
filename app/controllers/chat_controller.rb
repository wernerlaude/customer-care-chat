class ChatController < ApplicationController
  def index
    @chat_session = current_chat_session
    @messages = @chat_session.messages.order(:created_at)
  end

  def create_message
    @chat_session = current_chat_session

    content = params[:content]&.strip

    if content.present?
      # Benutzer-Nachricht speichern
      user_message = @chat_session.messages.create!(
        content: content,
        sender_type: 'visitor'
      )

      # AI-Antwort generieren
      generate_ai_response(@chat_session, content)
    end

    redirect_to root_path
  end

  def quick_reply
    @chat_session = current_chat_session

    reply_text = params[:reply_text]&.strip

    if reply_text.present?
      # Quick Reply als Benutzer-Nachricht speichern
      @chat_session.messages.create!(
        content: reply_text,
        sender_type: 'visitor'
      )

      # Passende Antwort je nach Quick Reply
      if reply_text.include?("Frage damit beantwortet")
        response = "Vielen Dank für Ihr Feedback! Es freut mich, dass ich Ihnen helfen konnte. Falls Sie weitere Fragen haben, stehe ich gerne zur Verfügung."
      else
        response = "Vielen Dank für Ihre Nachricht. Gerne helfe ich Ihnen weiter!"
      end

      @chat_session.messages.create!(
        content: response,
        sender_type: 'assistant'
      )
    end

    redirect_to root_path
  end

  private

  def generate_ai_response(chat_session, user_content)
    ai_responses = [
      "Hallo! Wie kann ich dir helfen?",
      "Das ist eine interessante Frage. Lass mich darüber nachdenken...",
      "Ich verstehe dein Anliegen. Hier ist meine Antwort:",
      "Gerne helfe ich dir dabei! Was möchtest du genau wissen?",
      "Das kann ich dir erklären. Hier sind die wichtigsten Punkte:",
      "Vielen Dank für deine Frage. Hier ist meine Antwort:"
    ]

    # Kurzes Delay simulieren
    sleep(0.3)

    response_content = "#{ai_responses.sample} (Antwort auf: \"#{user_content.truncate(30)}\")"

    chat_session.messages.create!(
      content: response_content,
      sender_type: 'assistant'
    )
  end
end