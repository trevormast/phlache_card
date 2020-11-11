Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :users, only: [] do
    resources :decks, only: [:show, :index, :new, :create, :edit, :update, :destroy] do
      # resources :cards
    end
  end
end
