class DosesController < ApplicationController

  before_action :set_cocktail, only: [:new, :create]
  before_action :set_dose, only: [:destroy, :edit, :update]

  def new
    # @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.create(dose_params)

    #link the dose to the cocktail
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dose.update(dose_params)
      redirect_to cocktail_path(@dose.cocktail), notice: 'Dose successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:amount, :description, :cocktail_id, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

end
