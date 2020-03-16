class Api::AlcoholsController < ApplicationController
  def index
    response = RestClient.get(
      "https://www.systembolaget.se/api/productsearch/search/sok-dryck",
      {
        params: {
          country: "Sverige",
          type: params[:q]
        },
        headers: {
          'Ocp-Apim-Subscription-Key': '6a8cd2f4f6bb4a3896e14974ab0f614f'
        }
      }
    )

    results = JSON.parse(response)
    render json: { alcohols: results["ProductSearchResults"] }
  end
end
