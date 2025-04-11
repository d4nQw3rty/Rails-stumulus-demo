class HomeController < ApplicationController
  def index
    @my_options = [[ "A101", "Primer valor"], ["A102", "Segundo valor"], ["X103", "Tercer valor"]]
  end

  def send_form
    name = params[:name]
    email = params[:email]
    message = params[:message]

    ContactMailer.contact_email(name, email, message).deliver_now

    redirect_to root_path, notice: 'Tu mensaje ha sido enviado exitosamente.'
  end
end
