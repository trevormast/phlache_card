Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :users, only: [] do
    resources :decks, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :cards, except: [:show, :index]
      resources :card_imports, only: [:index, :create]
    end
  end
end
