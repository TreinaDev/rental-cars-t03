class RentalsMailer < ApplicationMailer
  def scheduled(rental)
    @rental = rental
    mail(to: @rental.customer.email,
         subject: "Confirmação de Agendamento - #{@rental.code}")
  end
end