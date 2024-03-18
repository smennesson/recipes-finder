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
      let!(:recipes) { create_list(:recipe, max_recipes + 1) }

      it 'gives top ranking recipes' do
        get '/recipes'
        expect(response).to have_http_status(:success)
        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(response_body[:recipes].length).to eq(max_recipes)
        expect(response_body[:recipes].map { |recipe| recipe[:id] })
          .to eq(recipes.sort_by(&:rate).reverse.take(max_recipes).map(&:id))
      end
    end

    context 'with an ingredient as input' do
      let!(:recipes) { create_list(:recipe, 2) }
      let!(:matching_recipe1) { create(:recipe, ingredients: ['1 banana'], rate: 3) }
      let!(:matching_recipe2) { create(:recipe, ingredients: ['2 bananas'], rate: 2) }

      it 'gives recipes matching the given ingredient' do
        get '/recipes', params: { ingredients: ['banana'] }
        expect(response).to have_http_status(:success)
        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(response_body[:recipes].map { |recipe| recipe[:id] })
          .to eq([matching_recipe1.id, matching_recipe2.id])
      end
    end
  end
end
