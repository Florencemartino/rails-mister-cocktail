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
    redirect_to :cocktails
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def cocktail_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
