class CardsController < ApplicationController
   before_action :find_card, only: [:show, :edit, :update, :destroy]

  def index
  	@cards = Card.all.order("created_at DESC")
  end

  def show

  end

  def new
  	@card = Card.new
  end

  def create
  	@card = Card.new(card_params)

  	if @card.save
  	  redirect_to @card, notice: "Card Created"
  	else
  	  render 'new'
  	end
  end

  def edit
  end

  def update
  	if @card.update(card_params)
  	  redirect_to @card, notice: "Card Updated"
  	else
  	  render 'edit'
  	end
  end

  def destroy
  	@card.destroy
    redirect_to root_path
  end


  private

  def card_params
    params.require(:card).permit(:title, :description)
  end

  def find_card
  	@card = Card.find(params[:id])
  end
end
