class Api::IngredientsController < ApplicationController
  def index
    ingredients = [
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
    render json: { ingredients: ingredients }
  end
end
