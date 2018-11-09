class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]
  before_action :set_dose, only: [:destroy]

  def index
    @cocktails = Cocktail.all

    # To find the dose in the cocktail
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if  @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail), notice: 'Cocktail successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
