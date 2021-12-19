Rails.application.routes.draw do
  get 'weather/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/search', to: 'weather#index'
  root "weather#index"
end
