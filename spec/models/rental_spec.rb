require 'rails_helper'

RSpec.describe Rental, type: :model do
  context '#code' do
    let(:rental) { build(:rental) }

    it 'should generate a code on create' do
      rental.save
      expect(rental.code).to_not be_blank
    end

    it 'generate another if exists' do
      another_rental = create(:rental)
      allow(SecureRandom).to receive(:alphanumeric).and_return(another_rental.code,
                                                               'ABC123')
      rental.save
      expect(rental.code).not_to eq(another_rental.code)
    end
  end
end
