Rails.application.routes.draw do



  get 'orders/new'
  get 'orders/create'
  get 'orders/confirm'
  devise_for :buyers
  devise_for :sellers

  devise_scope :seller do
    post 'sellers/guest_sign_in', to: 'sellers/sessions#guest_sign_in'
  end
  
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

  resources :orders, only:[:new, :create,:index,:destroy] do
    collection do
      post :confirm
    end
  end

  resources :questions do
    resources :answers#editとupdateとdestroy追加するから今は保留, only: [:create]
  end
  #get "/questions/new", to: "questions#new"
  #post "/questions", to: "questions#create"
  #get "/questions/:id", to: "questions#show"

end
