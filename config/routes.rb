Rails.application.routes.draw do
  root to: 'posts#top'

  resources :posts, only: [] do
    collection do
      get :top
    end
  end
end
