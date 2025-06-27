Rails.application.routes.draw do
  root "chat#index"
  post "send_message", to: "chat#create_message"
  post "quick_reply", to: "chat#quick_reply"
end