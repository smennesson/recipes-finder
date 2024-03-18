# frozen_string_literal: true

class RecipesController < ApplicationController
  MAX_OUTPUT_RECIPES = 5

  def index
    recipes = Recipe
    unless params[:ingredients].nil?
      recipes = recipes.where("ingredients_tsvector @@ to_tsquery('#{params[:ingredients].first}')")
    end
    render json: { recipes: recipes.order(rate: :desc).limit(MAX_OUTPUT_RECIPES) }
  end
end
