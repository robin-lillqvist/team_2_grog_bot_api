RSpec.describe Api::AlcoholsController, type: :request do
  describe "GET /api/alcohols successfully" do
    before do
      get "/api/alcohols",
      params: {
        q: "Gin"
      }
    end

    it "should return a 200 response" do
      expect(response).to have_http_status 200
    end

    it "should return a list of alcohols" do
      expect(response_json["alcohols"].first["ProductNameBold"]).to eq "AB Stockholms Bränneri"
    end

    it "should return a swedish alcohol only" do
      binding.pry
      expect(response_json["alcohols"].first["Country"]).to eq "Sverige"
      expect(response_json["alcohols"].last["Country"]).to eq "Sverige"
    end
  end
end