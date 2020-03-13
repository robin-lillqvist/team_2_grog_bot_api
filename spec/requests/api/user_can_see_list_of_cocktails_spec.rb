# frozen_string_literal: true

RSpec.describe Api::CocktailsController, type: :request do
  describe "GET /api/cocktails successfully" do
    before do
      get "/api/cocktails",
        params: {
          q: "Lime juice",
        }
    end
    it "returns a 200 status" do
      expect(response.status).to eq 200
    end
    it "returns drink" do
      expect(response_json["drinks"].first["strDrink"]).to eq "Absolut myz"
    end
  end

  describe "GET /api/cocktails successfully" do
    before do
      get "/api/cocktails",
        params: {
          q: "Lingondrick",
        }
    end
    it "returns a 422 status" do
      expect(response.status).to eq 422
    end
    it "returns error message" do
      expect(response_json["message"]).to eq "You can not choose this ingredient"
    end
  end
end
