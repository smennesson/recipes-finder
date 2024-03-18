# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /' do
    context 'with no input arguments and no recipes data' do
      it 'gives an empty list' do
        get '/recipes'
        expect(response).to have_http_status(:success)
        response_body = JSON.parse(response.body)
        expect(response_body).to eq([])
      end
    end

    context 'with no input arguments' do
      before { create_list(:recipe, RecipesController::MAX_OUTPUT_RECIPES + 1) }

      it 'gives top ranking recipes' do
        pending 'Not yet implemented'
        get '/recipes'
        expect(response).to have_http_status(:success)
        response_body = JSON.parse(response.body)
        expect(response_body).to be_an_instance_of(Array)
        expect(response_body.length).to eq(RecipesController::MAX_OUTPUT_RECIPES)
      end
    end
  end
end
