class CocktailsController < ApplicationController
  before_action :fetch_cocktail, only: :show

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to @cocktail, notice: 'You have created the new BOMB!'
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def fetch_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
