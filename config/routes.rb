Rails.application.routes.draw do
  
  root "projects#index"
  resources :projects do 
    resources :votes
    resources :tasks
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
