class SelectionsController < ApplicationController
  FOOD_ITEMS = {
    1 => [ "Apple", "Banana", "Orange" ],
    2 => [ "Carrot", "Broccoli", "Spinach" ],
    3 => [ "Milk", "Cheese", "Yogurt" ],
    4 => [ "Chicken", "Beef", "Fish" ]
  }

  def index
    @food_options = [ [ 1, "Fruits" ], [ 2, "Vegetables" ], [ 3, "Dairy" ], [ 4, "Meat" ] ]
  end

  def food_options
    @selected_option = FOOD_ITEMS[params[:option].to_i]
    respond_to do |format|
      format.json { render json: @selected_option }
    end
  end
end
