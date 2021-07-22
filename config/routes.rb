Rails.application.routes.draw do



  devise_for :buyers
  devise_for :sellers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :sellers

  resources :fishs do
    resource :buyerfishs, only: [:create, :destroy]
    resources :questions do
      resources :answers
    end
  end
  resources :buyers


  resources :questions do
    resources :answers#editとupdateとdestroy追加するから今は保留, only: [:create]
  end
  #get "/questions/new", to: "questions#new"
  #post "/questions", to: "questions#create"
  #get "/questions/:id", to: "questions#show"

end
