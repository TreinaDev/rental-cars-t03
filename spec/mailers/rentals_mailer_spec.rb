require 'rails_helper'

describe RentalsMailer do
  context '#scheduled' do
    let(:rental) { create(:rental) }
    let(:mail) { RentalsMailer.scheduled(rental).deliver_now }

    it 'renders subject' do
      expect(mail.subject).to eq("Confirmação de Agendamento - #{rental.code}")
    end

    it 'renders receiver' do
      expect(mail.to).to eq([rental.customer.email])
    end

    it 'renders mail sender' do
      expect(mail.from).to eq(['no-reply@rentalcars.com.br'])
    end

    it 'renders mail body' do
      expect(mail.body.encoded).to match(rental.code)
      expect(mail.body.encoded).to match(I18n.l(rental.start_date))
      expect(mail.body.encoded).to match(I18n.l(rental.end_date))
    end
  end
end