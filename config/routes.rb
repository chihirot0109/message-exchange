Rails.application.routes.draw do
  devise_for :users, controller: :confirmations
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]
  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create, :update, :destroy]
  end
end
