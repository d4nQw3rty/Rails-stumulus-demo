class ContactMailer < ApplicationMailer

  def contact_email(name, email, message)
    @name = name
    @message = message
    mail(to: 'danlinmoy@gmail.com', subject: 'Nuevo mensaje de contacto')
  end
end
