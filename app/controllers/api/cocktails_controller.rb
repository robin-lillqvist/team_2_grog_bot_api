# frozen_string_literal: true

class Api::CocktailsController < ApplicationController

	before_action :get_cocktail_by_id, only: :show
	
  def index
    if AVAILABLE_INGREDIENTS.include? params[:q]
      results = CocktailApiService.get_by_ingredient(params[:q])
      render json: { drinks: results['drinks'] }
    else
      render json: { message: 'You can not choose this ingredient' }, status: 422
    end
  end

  def show
    sanitized_cocktail = format_cocktail(@cocktail)
    if @cocktail['idDrink'] == params[:id]
      render json: { drink: sanitized_cocktail }
    else
      render json: { message: 'Oops, we could not find this cocktail' }, status: 422
    end
  end

  private

  def format_cocktail(cocktail)
    {
      id: cocktail['idDrink'],
      name: cocktail['strDrink'],
      category: cocktail['strCategory'],
      glass: cocktail['strGlass'],
      instructions: cocktail['strInstructions'],
      image: cocktail['strDrinkThumb'],
      ingredients: format_ingredients(cocktail)
    }
  end

  def format_ingredients(cocktail)
    ingredients = []
    cocktail.select do |key, value|
      next unless key.to_s.start_with? 'strIngredient'

      ingredient = {}
      number = key.to_s.scan(/\d+$/).first
      ingredient[:name] = value unless value.nil?
      cocktail.select do |key_2, value_2|
        next unless key_2.to_s.start_with? 'strMeasure'

        ingredient[:measure] = MeasurementConversionService.convert(value_2) if key_2.to_s.scan(/\d+$/).first == number && !value.nil?
      end
      ingredients.push(ingredient) unless ingredient.empty?
    end
    ingredients
	end

	def get_cocktail_by_id
		@cocktail = CocktailApiService.get_by_id(params[:id])
	end
end
