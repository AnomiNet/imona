Rails.application.routes.draw do
  root to: 'posts#top'

  resources :posts, only: [:create, :new] do
    collection do
      get :top
    end
    member do
      get :context
    end
  end

  resources :votes, only: [] do
    collection do
      post :create_or_update
    end
  end

  resources :users, only: [:create, :show]


  delete '/logout' => 'sessions#destroy', as: :logout
end
