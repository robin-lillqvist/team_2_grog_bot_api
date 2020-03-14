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
    sanitized_drink =
      {
        id: results["drinks"].first["idDrink"],
        name: results["drinks"].first["strDrink"],
        category: results["drinks"].first["strCategory"],
        glass: results["drinks"].first["strGlass"],
        instructons: results["drinks"].first["strInstructions"],
        image: results["drinks"].first["strDrinkThumb"],
        ingredients: [
          { name: results["drinks"].first["strIngredient1"],
            measure: results["drinks"].first["strMeasure1"] },
          { name: results["drinks"].first["strIngredient2"],
            measure: results["drinks"].first["strMeasure2"] },
          { name: results["drinks"].first["strIngredient3"],
            measure: results["drinks"].first["strMeasure3"] },
          { name: results["drinks"].first["strIngredient4"],
            measure: results["drinks"].first["strMeasure4"] },
          { name: results["drinks"].first["strIngredient5"],
            measure: results["drinks"].first["strMeasure5"] },
          { name: results["drinks"].first["strIngredient6"],
            measure: results["drinks"].first["strMeasure6"] },
          { name: results["drinks"].first["strIngredient7"],
            measure: results["drinks"].first["strMeasure7"] },
          { name: results["drinks"].first["strIngredient8"],
            measure: results["drinks"].first["strMeasure8"] },
          { name: results["drinks"].first["strIngredient9"],
            measure: results["drinks"].first["strMeasure9"] },
          { name: results["drinks"].first["strIngredient10"],
            measure: results["drinks"].first["strMeasure10"] },
        ],
      }
    if results["drinks"].first["idDrink"] == params[:id]
      render json: { drink: sanitized_drink }
    else
      render json: { message: "Oops, we could not find this cocktail" }, status: 422
    end
  end
end
