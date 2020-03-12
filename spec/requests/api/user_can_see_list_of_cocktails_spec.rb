RSpec.describe Api::CocktailsController, type: :request do
  describe "GET /api/cocktails" do
    before do
      get "/api/cocktails", 
      params: {
        q: "Rum,Lime_juice"
      }
    end
    it "returns a 200 status" do
      expect(response.status).to eq 200
    end
    it "returns drink" do
      expect(JSON.parse(response.body)["drinks"].first["strDrink"]).to eq "Barracuda"
    end
  end
end