Rails.application.routes.draw do
  get 'weather/index'
  get 'weather/get_by_city'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "weather#index"
end
