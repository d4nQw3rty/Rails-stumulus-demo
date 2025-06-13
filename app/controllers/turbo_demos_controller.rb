class TurboDemosController < ApplicationController
  include ConstantConcern
  def index
    session[:count] ||= 0
  end

  def content1
    session[:count] = 0
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("content", partial: "content1") }
    end
  end

  def content2
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("content", partial: "content2") }
    end
  end

  def content3
    @food_headings = FOOD_HEADINGS
    @my_options = [ [ "A101", "First value" ], [ "T102", "Second value" ], [ "X103", "Third value" ] ]
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("content", partial: "content3") }
    end
  end

  def increment
    session[:count] ||= 0
    session[:count] += 1
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("content", partial: "content1") }
    end
  end

  def decrement
    session[:count] ||= 0
    session[:count] -= 1
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("content", partial: "content1") }
    end
  end

  def text_processor
    text = params[:chars] || ""
    count = text.length
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("total", partial: "result", locals: { count: count })
      end
    end
  end

  def select_demo_1
    value = params[:selected]
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("value", partial: "selected_val", locals: { val: value })
      end
    end
  end

  def select_demo_2
    heading_value = params[:heading]
    food = FOOD_ITEMS[heading_value.to_i]
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "food",
          partial: "food_options",
          locals: { food_options: food }
        )
      end
    end
  end
end
