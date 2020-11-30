class CardImportsController < ApplicationController
  before_action :set_user_and_deck

  def index
    # get all cards in the deck
    @cards = @deck.cards

    send_data Card.generate_csv(@cards), filename: "#{ @deck.name.parameterize }-cards.csv"
  end

  def create

  end

  def set_user_and_deck
    @user = User.find(params[:user_id])
    @deck = Deck.find(params[:deck_id])

    # restrict actions to current user
    redirect_to '/' if current_user != @user
  end
end
