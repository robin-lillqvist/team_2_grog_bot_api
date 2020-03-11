class Api::IngredientsController < ApplicationController
  AVAILABLE_INGREDIENTS = [
    "Coca-Cola", 
    "Lemon", 
    "Milk", 
    "Egg white", 
    "Lime juice", 
    "Sugar Syrup", 
    "Whipping cream", 
    "Orange juice", 
    "Lemon juice", 
    "Coffee", 
    "Lime", 
    "Lemon", 
    "Orange", 
    "Pineapple juice", 
    "Tonic Water", 
    "Mint", 
    "Ginger", 
    "Ice", 
    "Ginger ale", 
    "Passion fruit juice"
  ]
  
  def index  
    render json: { ingredients: API::IngredientsController.AVAILABLE_INGREDIENTS }
  end
end
