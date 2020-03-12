RSpec.describe Api::CocktailsController, type: :request do
  describe "GET /api/cocktails successfully" do
    before do
      get "/api/cocktails",
          params: {
            q: "Lime_juice",
          }
    end
    it "returns a 200 status" do
      expect(response.status).to eq 200
    end
    it "returns drink" do
      expect(response_json["drinks"].first["strDrink"]).to eq "Absolut limousine"
    end
  end
end
