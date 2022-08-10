Rails.application.routes.draw do
  resources :restaurants, except: %i[edit update destroy] do
    # get '/reviews', to: 'reviews#index'
    resources :reviews, only: %i[index new create]
  end
end
