module CocktailApiService
	def self.get_by_ingredient(ingredient)
		response = RestClient.get(
			'https://www.thecocktaildb.com/api/json/v2/9973533/filter.php',
			params: {
				i: ingredient
			}
		)
		results = JSON.parse(response)
	end

	def self.get_by_id(id)
		response = RestClient.get(
      'https://www.thecocktaildb.com/api/json/v2/9973533/lookup.php',
      params: {
        i: id
      }
    )
    results = JSON.parse(response)
    cocktail = results['drinks'].first
	end
end