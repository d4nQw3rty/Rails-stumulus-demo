class HomeController < ApplicationController
  def index
    @my_options = [ [ "A101", "First value" ], [ "T102", "Second value" ], [ "X103", "Third value" ] ]
  end

  def send_form
    name = params[:name]
    email = params[:email]
    message = params[:message]

    ContactMailer.contact_email(name, email, message).deliver_now

    redirect_to root_path, notice: "Tu mensaje ha sido enviado exitosamente."
  end
end
