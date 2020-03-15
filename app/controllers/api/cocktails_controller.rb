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

  def show
    response = RestClient.get(
      "https://www.thecocktaildb.com/api/json/v2/9973533/lookup.php",
      {
        params: {
          i: params[:id]
        }
      }
    )
    results = JSON.parse(response)
    cocktail = results["drinks"].first

    ingredients = []
    cocktail.select do |key, value|
      next unless key.to_s.start_with? "strIngredient"
      ingredient = {}
      number = key.to_s.scan(/\d+$/).first
      ingredient[:name] = value unless value.nil?
      cocktail.select do |key_2, value_2|
        next unless key_2.to_s.start_with? "strMeasure"
        ingredient[:measure] = value_2 if key_2.to_s.scan(/\d+$/).first == number && value != nil
      end
      ingredients.push(ingredient) unless ingredient.empty?
    end

    sanitized_cocktail =
      [{
        id: cocktail["idDrink"],
        name: cocktail["strDrink"],
        category: cocktail["strCategory"],
        glass: cocktail["strGlass"],
        instructions: cocktail["strInstructions"],
        image: cocktail["strDrinkThumb"],
        ingredients: ingredients
      }]
    if results["drinks"].first["idDrink"] == params[:id]
      render json: { drink: sanitized_cocktail }
    else
      render json: { message: "Oops, we could not find this cocktail" }, status: 422
    end
  end
end
