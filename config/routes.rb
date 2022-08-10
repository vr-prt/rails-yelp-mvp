Rails.application.routes.draw do
  resources :restaurants, except: %i[edit update destroy] do
    # ressources :review, only: %i[index new create]
  end
end
