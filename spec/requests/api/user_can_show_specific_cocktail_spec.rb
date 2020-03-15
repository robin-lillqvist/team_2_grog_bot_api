# frozen_string_literal: true

RSpec.describe Api::CocktailsController, type: :request do
  describe 'GET /api/cocktails/12754 successfully' do
    before do
      get '/api/cocktails/12754'
    end

    it 'returns a 200 status' do
      expect(response.status).to eq 200
    end

    it 'returns name of drink' do
      expect(response_json['drink']['name']).to eq 'Sex on the Beach'
    end
  end

  describe 'GET /api/cocktails/ unsuccessfully' do
    before do
      get '/api/cocktails/99999'
    end

    it 'returns a 422 status' do
      expect(response.status).to eq 422
    end

    it 'returns a message' do
      expect(response_json['message']).to eq 'Oops, we could not find this cocktail'
		end
  end
end
