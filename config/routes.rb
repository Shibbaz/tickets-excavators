Rails.application.routes.draw do
  resources :tickets
  get '/ticket_dates', to: 'tickets#ticket_dates'
end
