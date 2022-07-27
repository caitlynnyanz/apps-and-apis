Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/fortune", controller: "my_examples", action: "fortune_app"
  # get "/lotto_app", controller: "my_examples", action: "random_lotto"

  get "/99bottles", controller: "my_examples", action: "lyrics"
end
