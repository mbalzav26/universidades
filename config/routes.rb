Rails.application.routes.draw do
  
  resources :universities do
    resources :programs, module: :universities
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "universities#index"
end
