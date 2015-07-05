Rails.application.routes.draw do
  root to: 'posts#top'

  resources :posts, only: [:create, :index, :new] do
    collection do
      get :top
    end
  end

  resources :users, only: [:create]

  delete '/logout' => 'sessions#destroy', as: :logout
end
