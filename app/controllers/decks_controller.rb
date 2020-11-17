class DecksController < ApplicationController
  before_action :set_user

  def index
    @decks = @user.decks
  end

  def show
    @deck = Deck.find(params[:id])
    @cards = @deck.cards

    @react_layout = true

    render 'react_show'
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
    @deck = Deck.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:id])

    if @deck.update(deck_params)
      redirect_to user_decks_path(@user)
    else
      redirect_to edit_user_deck(@user, @deck)
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

    def set_user
      @user = User.find(params[:user_id])
      # restrict actions to current user
      redirect_to '/' if current_user != @user
    end
end
