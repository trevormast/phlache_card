require 'deck_card_synchronizer'

class DecksController < ApplicationController
  before_action :set_user

  def index
    @decks = @user.decks
  end

  def show
    # get the deck
    @deck = Deck.includes(:cards).find(params[:id])

    # use the react layout
    @react_layout = true

    # render the deck with cards included
    render 'show', locals: {
      deck: @deck.to_json(
        only: [:id, :name, :user_id],
        include: {
          cards: { only: [:id, :front, :back, :weight]
        }
      })
    }
  end

  def new
    @deck = @user.decks.build
  end

  def create
    @deck = @user.decks.build(deck_params)

    if @deck.save
      redirect_to user_decks_path(@user)
    else
      redirect_to new_user_deck(@user)
    end
  end

  def edit
    @deck = Deck.includes(:cards).find(params[:id])
  end

  def update
    @deck = Deck.find(params[:id])

    card_sync = DeckCardSynchronizer.new(@deck, cards_params)
    # reset weight for updated cards

    # if there were no card sync errors and the deck is updated
    if card_sync.perform && @deck.update(deck_params)
      redirect_to user_decks_path(@user)
    else
      redirect_to edit_user_deck_path(@user, @deck)
    end
  end

  def destroy
    @deck = Deck.find(params[:id])

    @deck.destroy

    redirect_to user_decks_path(@user)
  end

  private
    def deck_params
      params.require(:deck).permit(:name)
    end

    def cards_params
      params.permit(cards: [:id, :front, :back])
    end

    def set_user
      @user = User.find(params[:user_id])
      # restrict actions to current user
      redirect_to '/' if current_user != @user
    end
end
