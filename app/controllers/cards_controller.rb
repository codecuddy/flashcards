class CardsController < ApplicationController

  before_action :find_deck, only: [:create, :edit, :update, :destroy]
  before_action :find_card, only: [:edit, :update, :destroy]

  def create
    @card = @deck.cards.create(card_params)
    if @card.save
      redirect_to deck_path(@deck), notice: "Card Created"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to deck_path(@deck), notice: "Card Updated"
    else
      render 'edit'
    end
  end


  def destroy
    @card.destroy
    redirect_to deck_path(@card)
  end

  private

  def card_params
    params.require(:card).permit(:title, :description)
  end

  def find_deck 
    @deck = Deck.find(params[:deck_id])
  end

  def find_card
    @card = @deck.cards.find(params[:id])
  end

end

