Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :users, only: [] do
    resources :decks, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :cards, except: [:show]
    end
  end
end
