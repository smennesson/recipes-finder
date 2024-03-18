# frozen_string_literal: true

class RecipesController < ApplicationController
  MAX_OUTPUT_RECIPES = 5

  def index
    recipes = Recipe.order(rate: :desc).limit(MAX_OUTPUT_RECIPES).all
    render json: { recipes: recipes }
  end
end
