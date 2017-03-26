class DecksController < ApplicationController

   before_action :find_deck, only: [:show, :edit, :update, :destroy]

  def index
  	@decks = Deck.all.order("created_at DESC")
  end

  def show
  end

  def new
  	@deck = @decks.build
  end

  def create
  	@deck = @decks.build(deck_params)

  	if @deck.save
  	  redirect_to @deck, notice: "Deck Created"
  	else
  	  render 'new'
  	end
  end


  def edit
  end

  def update
  	if @deck.update(deck_params)
  	  redirect_to deck_path, notice: "Deck Updated"
  	else
  	  render 'edit'
  	end
  end

  def destroy
  	@deck.destroy
    redirect_to root_path
  end
end


  private

  def deck_params
    params.require(:deck).permit(:title, :description)
  end

  def find_deck
    @deck = Deck.find(params[:id])
  end

