class RecettesController < ApplicationController
  def index
    @recettes = Recette.all
  end

  def show
    @recette = Recette.find(:index)
  end

  def new
    @recettte = Recette.new
  end

  def create
    @recette=Recette.new(recette_params)
    @recette.user=current_user
    if @recette.save
      redirect_to @recette, notice: "Recette créée avec succès"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @recette.update(recette_params)
      redirect to @recette, notice: "Recette mise à jour avec succès"
    else
      render "edit"
    end
  end

  def destroy
    @recette.destroy
    redirect_to recettes_path(@recette)
  end

  private
  def set_recette
    @recette = Recette.find(params[:id])
  end

  def car_params
    params.require(:recette).permit(:nom, :description, :categorie, :durée, :pays, :ingredients, :préparation, :photo_url)
  end
end
