class MessagesController < ApplicationController
  def create
    @chat_session = current_chat_session
    @message = @chat_session.messages.build(message_params.merge(sender_type: 'visitor'))

    if @message.save
      # AI Response generieren
      generate_ai_response(@chat_session, @message.content)

      # Einfach zurück zum Chat redirecten
      redirect_to root_path
    else
      @messages = @chat_session.messages.order(:created_at)
      render 'chat/index', status: :unprocessable_entity
    end
  end

  private

  def message_params
    # Prüfen ob message Parameter existiert
    if params[:message].present?
      params.require(:message).permit(:content)
    else
      # Fallback für direkte Parameter
      { content: params[:content] }
    end
  end

  def generate_ai_response(chat_session, user_message)
    # Demo AI Response
    ai_responses = [
      "Hallo! Wie kann ich dir helfen?",
      "Das ist eine interessante Frage. Lass mich darüber nachdenken...",
      "Ich verstehe dein Anliegen. Hier ist meine Antwort:",
      "Gerne helfe ich dir dabei! Was möchtest du genau wissen?",
      "Das kann ich dir erklären. Hier sind die wichtigsten Punkte:",
      "Vielen Dank für deine Frage. Hier ist meine Antwort:"
    ]

    # Simuliere kurzes Delay
    sleep(0.5)

    response_content = ai_responses.sample + " (Antwort auf: \"#{user_message.truncate(30)}\")"

    chat_session.messages.create!(
      content: response_content,
      sender_type: 'assistant',
      is_ai_response: true
    )
  end
end