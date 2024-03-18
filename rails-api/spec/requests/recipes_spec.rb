# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /' do
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
      let(:max_recipes) { RecipesController::MAX_OUTPUT_RECIPES }
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
  end
end
