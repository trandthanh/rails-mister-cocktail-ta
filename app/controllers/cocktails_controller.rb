class CocktailsController < ApplicationController
  def index
    if params[:query].present?
      @query = params[:query]
      @cocktails = Cocktail.joins(:doses).joins(:ingredients).where("ingredients.name ILIKE '%#{params[:query]}%'")
    else
      @cocktails = Cocktail.all
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @review = Review.new
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
