class Api::IngredientsController < ApplicationController
  def index  
    render json: { ingredients: AVAILABLE_INGREDIENTS }
  end
end
