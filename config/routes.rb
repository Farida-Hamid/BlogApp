Rails.application.routes.draw do
  get 'comments/new'
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[new create]
    end
  end
end
