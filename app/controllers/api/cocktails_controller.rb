class Api::CocktailsController < ApplicationController
  def index
    if AVAILABLE_INGREDIENTS.include? params[:q]
      response = RestClient.get(
        "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php",
        {
          params: {
            i: params[:q]
          }
        }
      )
      results = JSON.parse(response)
        render json: { drinks: results["drinks"] }
    else
      render json: { message: "You can not choose this ingredient" }, status: 422
    end
  end
end
