Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do
    root "projects#index"
    resources :projects do 
      resources :votes
      resources :tasks
    end
  end
  # root 'devise/sessions#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
