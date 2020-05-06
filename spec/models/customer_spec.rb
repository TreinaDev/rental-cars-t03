require 'rails_helper'

RSpec.describe Customer, type: :model do
  context '#search' do
    it 'by exact name' do
      customer = Customer.create!(name: 'Fulano Sicrano', 
                                  email: 'fulano@email.com',
                                  document: '116.801.156-69')
      another_customer = Customer.create!(name: 'João da Silva', 
                                          email: 'joao@dasilva.com',
                                          document: '581.280.655-13')

      result = Customer.search('fulano')

      expect(result).to include(customer)
      expect(result).not_to include(another_customer)
    end

    it 'by partial name' do
      customer = Customer.create!(name: 'Fulano Sicrano', 
                                  email: 'fulano@email.com',
                                  document: '116.801.156-69')
      another_customer = Customer.create!(name: 'João da Silva', 
                                          email: 'joao@dasilva.com',
                                          document: '581.280.655-13')

      result = Customer.search('fulano')

      expect(result).to include(customer)
      expect(result).not_to include(another_customer)
    end

    it 'finds nothing' do
      customer = Customer.create!(name: 'Fulano Sicrano', 
                                  email: 'fulano@email.com',
                                  document: '116.801.156-69')
      another_customer = Customer.create!(name: 'João da Silva', 
                                          email: 'joao@dasilva.com',
                                          document: '581.280.655-13')

      result = Customer.search('test')

      expect(result).to be_blank
    end

    it 'by cpf' do
      customer = Customer.create!(name: 'Fulano Sicrano', 
                                  email: 'fulano@email.com',
                                  document: '116.801.156-69')
      another_customer = Customer.create!(name: 'João da Silva', 
                                          email: 'joao@dasilva.com',
                                          document: '581.280.655-13')

      result = Customer.search('116.801.156-69')

      expect(result).to include(customer)
      expect(result).not_to include(another_customer)
    end
  end
end
