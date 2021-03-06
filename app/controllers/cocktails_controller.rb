class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]
  def index
    @cocktails = Cocktail.all
  end

  def show(); end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
  end

  def destroy
    @cocktails = Cocktail.find(params[:id])
    @cocktails.destroy
    redirect_to :cocktails
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :body, :photo)
  end
end

