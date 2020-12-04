class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @recipe = @recipes.sample
    @recipes2_random = @recipes.sample(10)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
