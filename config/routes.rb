Rails.application.routes.draw do



  devise_for :buyers
  devise_for :sellers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :sellers
  resources :fishs do
    resource :buyerfishs, only: [:create, :destroy]
  end
  resources :buyers


  resources :questions do
    resources :answers, only: [:create]
  end
  #get "/questions/new", to: "questions#new"
  #post "/questions", to: "questions#create"
  #get "/questions/:id", to: "questions#show"

end
