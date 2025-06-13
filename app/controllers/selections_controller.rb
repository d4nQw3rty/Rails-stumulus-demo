class SelectionsController < ApplicationController
  require "net/http"
  require "json"
  require "uri"
  include ConstantConcern


  def index
    @food_headings = FOOD_HEADINGS
   end

  def food_options
    @selected_option = FOOD_ITEMS[params[:option].to_i]
    respond_to do |format|
      format.json { render json: @selected_option }
    end
  end

  def fetch_ip_data
    uri = URI.parse(params[:url])
    response = Net::HTTP.get_response(uri)
    render json: response.body, status: response.code
  end
end
