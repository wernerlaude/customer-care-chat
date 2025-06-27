demo_session = ChatSession.create!(
  session_id: 'demo_session_123',
  visitor_name: 'Demo Besucher',
  status: 'active'
)

# Demo Conversation
demo_session.messages.create!([
                                {
                                  content: 'Hallo! Ich hätte eine Frage zu euren Produkten.',
                                  sender_type: 'visitor'
                                },
                                {
                                  content: 'Hallo! Gerne helfe ich dir bei Fragen zu unseren Produkten. Was möchtest du wissen?',
                                  sender_type: 'assistant',
                                  is_ai_response: true
                                },
                                {
                                  content: 'Welche Preise habt ihr denn?',
                                  sender_type: 'visitor'
                                },
                                {
                                  content: 'Unsere Preise variieren je nach Produkt. Für eine detaillierte Preisliste kann ich dir gerne weiterhelfen. Welches Produkt interessiert dich besonders?',
                                  sender_type: 'assistant',
                                  is_ai_response: true
                                }
                              ])

puts "✅ Demo Chat-Session erstellt!"
puts "Session ID: #{demo_session.session_id}"
puts "Nachrichten: #{demo_session.messages.count}"