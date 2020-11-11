class CardsController < ApplicationController
  before_action :set_user_and_deck

  def index
    @cards = @deck.cards
  end

  def new
    @card = @deck.cards.build
  end

  def create
    @card = @deck.cards.build(card_params)

    if @card.save
      redirect_to user_deck_cards_path(@user, @deck)
    else
      redirect_to new_user_deck_card_path(@user, @deck)
    end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])

    if @card.update(card_params)
      redirect_to user_deck_cards_path(@user, @deck)
    else
      redirect_to edit_user_deck_card_path(@user, @deck)
    end
  end

  def destroy
    @card = Card.find(params[:id])

    @card.destroy

    redirect_to user_deck_cards_path(@user, @deck)
  end

  private
    def card_params
      params.require(:card).permit(:front, :back)
    end

    def set_user_and_deck
      @user = User.find(params[:user_id])
      @deck = Deck.find(params[:deck_id])

      # restrict actions to current user
      redirect_to '/' if current_user != @user
    end
end
