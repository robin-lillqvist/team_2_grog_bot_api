RSpec.describe Api::IngredientsController, type: :request do
  describe "GET /api/ingredients" do
    before do
      get "/api/ingredients"
    end

    it "should return a 200 response" do
      expect(response).to have_http_status 200
    end

    it "should return ingredient" do
      expect((response_json)["ingredients"].count).to eq 20
    end
  end
end
