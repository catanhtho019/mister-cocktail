class CocktailsController < ApplicationController
  def index

    if params[:name].present?
      @cocktails = Cocktail.where("name ILIKE '%#{params[:name]}%'")

    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @review = Review.new
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def update
    set_cocktail
    if @cocktail.update(cocktail_params)
      redirect_to @cocktail, notice: 'cocktail was successfully updated.'
    else
      format.html { render :edit }
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
