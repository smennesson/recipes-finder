# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /' do
    let(:max_recipes) { RecipesController::MAX_OUTPUT_RECIPES }

    context 'with no input arguments and no recipes data' do
      it 'gives an empty list' do
        get '/recipes'
        expect(response).to have_http_status(:success)
        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(response_body).to be_an_instance_of(Hash)
        expect(response_body[:recipes]).to eq([])
      end
    end

    context 'with no input arguments' do
      let!(:recipes) { create_list(:recipe, max_recipes) }
      let!(:undesired_recipe) { create(:recipe, rate: 0) }

      it 'gives top ranking recipes' do
        get '/recipes'
        expect(response).to have_http_status(:success)
        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(response_body[:recipes].length).to eq(max_recipes)
        expect(response_body[:recipes].map { |recipe| recipe[:id] })
          .to eq(recipes.sort_by(&:rate).reverse.map(&:id))
      end
    end

    context 'with an ingredient as input' do
      let!(:recipes) { create_list(:recipe, 2, ingredients: ['2 tomates']) }
      let!(:matching_recipe1) { create(:recipe, ingredients: ['1 banane'], rate: 3) }
      let!(:matching_recipe2) { create(:recipe, ingredients: ['4 bananes'], rate: nil) }
      let!(:matching_recipe3) { create(:recipe, ingredients: ['2 bananes'], rate: 2) }

      it 'gives recipes matching the given ingredient, ordered by rate' do
        get '/recipes', params: { ingredients: ['banane'] }
        expect(response).to have_http_status(:success)
        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(response_body[:recipes].map { |recipe| recipe[:id] })
          .to eq([matching_recipe1.id, matching_recipe3.id, matching_recipe2.id])
      end
    end

    context 'with several ingredients as input' do
      let!(:recipe1) { create(:recipe, ingredients: ['1 oeuf']) }
      let!(:recipe2) { create(:recipe, ingredients: ['2 bananes']) }
      let!(:recipe3) { create(:recipe, ingredients: ['1 oeuf', '2 bananes']) }

      it 'gives recipes matching all given ingredients' do
        get '/recipes', params: { ingredients: %w[banane oeuf] }
        expect(response).to have_http_status(:success)
        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(response_body[:recipes].length).to eq(1)
        expect(response_body[:recipes][0][:id]).to eq(recipe3.id)
      end
    end

    context 'with special characters' do
      let!(:recipe1) { create(:recipe, ingredients: ['1 oeuf']) }
      let!(:recipe2) { create(:recipe, ingredients: ['2 bananes']) }
      let!(:recipe3) { create(:recipe, ingredients: ['1 oeuf', '2 bananes']) }

      it 'sanitizes strings and gives recipes matching all given ingredients' do
        get '/recipes', params: { ingredients: ['banane &\'",;', 'oeuf'] }
        expect(response).to have_http_status(:success)
        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(response_body[:recipes].length).to eq(1)
        expect(response_body[:recipes][0][:id]).to eq(recipe3.id)
      end
    end
  end
end
