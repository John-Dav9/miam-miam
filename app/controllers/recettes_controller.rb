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
      redirect_to @recette
    else
      render "new"
    end
  end

  def update
    if @recette.update(recette_params)
      redirect to @recette
    else
      render "edit"
    end
  end

  def destroy
    @recette.destroy
    redirect to recettes_path
  end

  private
  def set_recette
    (params[:id])
  end
end
