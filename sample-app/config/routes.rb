Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/hello_path", controller: "example_pages", action: "hello_method"
  get "/fibonacci", controller: "example_pages", action: "fibonacci_sequence"
  get "/countdown", controller: "example_pages", action: "countdown_method"
  get "/time", controller: "example_pages", action: "time"
end
