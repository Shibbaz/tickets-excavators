Rails.application.routes.draw do
  resources :tickets
  get '/ticket_dates', to: 'tickets#ticket_dates'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
