class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(cocktail_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to :cocktail
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
end
