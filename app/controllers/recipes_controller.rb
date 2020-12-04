class RecipesController < ApplicationController
  def index
    if params[:query].present?
      @recipes = Recipe.where("title ILIKE ?", "%#{params[:query]}%")
      @recipes2_random = @recipes.sample(30)
    else
      @recipes = Recipe.all
      @recipe = @recipes.sample
      @recipes2_random = @recipes.sample(30)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
