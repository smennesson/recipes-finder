# frozen_string_literal: true

class RecipesController < ApplicationController
  MAX_OUTPUT_RECIPES = 5

  def index
    render json: []
  end
end
