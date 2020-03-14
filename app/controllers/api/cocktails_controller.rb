class Api::CocktailsController < ApplicationController
  def index
    if AVAILABLE_INGREDIENTS.include? params[:q]
      response = RestClient.get(
        "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php",
        {
          params: {
            i: params[:q],
          },
        }
      )
      results = JSON.parse(response)
      render json: { drinks: results["drinks"] }
    else
      render json: { message: "You can not choose this ingredient" }, status: 422
    end
  end

  def show
    response = RestClient.get(
      "https://www.thecocktaildb.com/api/json/v2/9973533/lookup.php",
      {
        params: {
          i: params[:id],
        },
      }
    )
    results = JSON.parse(response)
    if results["drinks"].first['idDrink'] == params[:id]
      render json: { drink: results["drinks"].first }
    else
      render json: { message: "Oops, we could not find this cocktail" }, status: 422
    end
  end
end
