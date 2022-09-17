Rails.application.routes.draw do
  devise_for :users
  # root "articles#index"
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy]
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create]
  end

   namespace :api do
    namespace :v1 do
      resources :users, only: [:index] do
        resources :posts, only: [:show, :index] do
          resources :comments, only: [:new, :create]
        end
      end
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
