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
    sanitized_cocktail = results['drinks'].map { |cocktail|
      {
        id: cocktail["idDrink"],
        name: cocktail["strDrink"],
        category: cocktail["strCategory"],
        glass: cocktail["strGlass"],
        instructions: cocktail["strInstructions"],
        image: cocktail["strDrinkThumb"],
        ingredients: [
          { name: cocktail["strIngredient1"],
            measure: cocktail["strMeasure1"] },
          { name: cocktail["strIngredient2"],
            measure: cocktail["strMeasure2"] },
          { name: cocktail["strIngredient3"],
            measure: cocktail["strMeasure3"] },
          { name: cocktail["strIngredient4"],
            measure: cocktail["strMeasure4"] },
          { name: cocktail["strIngredient5"],
            measure: cocktail["strMeasure5"] },
          { name: cocktail["strIngredient6"],
            measure: cocktail["strMeasure6"] },
          { name: cocktail["strIngredient7"],
            measure: cocktail["strMeasure7"] },
          { name: cocktail["strIngredient8"],
            measure: cocktail["strMeasure8"] },
          { name: cocktail["strIngredient9"],
            measure: cocktail["strMeasure9"] },
          { name: cocktail["strIngredient10"],
            measure: cocktail["strMeasure10"] },
        ],
      }
    }
    if results["drinks"].first["idDrink"] == params[:id]
      render json: { drink: sanitized_cocktail }
    else
      render json: { message: "Oops, we could not find this cocktail" }, status: 422
    end
  end
end
