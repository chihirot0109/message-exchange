Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
  root to: 'pages#home'
  get '/privacy', to: 'pages#privacy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index]
    resources :conversations, only: [:show, :create] do
    resources :messages, only: [:create]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :conversations, only: [:index, :show, :create] do
        resources :messages, only: [:show, :create]
      end
    end
  end
end
