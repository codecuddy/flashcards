class CardsController < ApplicationController

  before_action :find_deck, only: [:show, :edit, :create, :update, :destroy]
  before_action :find_card, only: [:show, :edit, :update, :destroy]

  def create
    @card = @deck.cards.create(card_params)
    if @card.save
      redirect_to deck_path(@deck), notice: "Card Created"
    else
      render 'new'
    end
  end

  def show
    @cards = Card.all.order("created_at DESC")
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
    redirect_to deck_path(@deck)
  end

  private

  def card_params
    params.require(@deck.card).permit(:title, :description)
  end

  def find_deck 
    @deck = Deck.find(params[:deck_id])
    render action: '_card'
  end

  def find_card
    @card = @deck.cards.find(params[:id])
  end

end
