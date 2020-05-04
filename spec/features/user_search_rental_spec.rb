require 'rails_helper'

feature 'User search rental' do
  scenario 'successfully' do
    customer = Customer.create!(name: 'Fulano Sicrano', 
                                document: '185.972.440-03', 
                                email: 'teste@teste.com.br')
    car_category = CarCategory.create!(name: 'A', daily_rate: 100, 
                                       car_insurance: 100,
                                       third_part_insurance: 100)
    user = User.create!(email: 'test@test.com.br', password: '12345678')
    rental = Rental.create!(customer: customer, car_category: car_category,
                            start_date: 1.day.from_now, 
                            end_date: 2.days.from_now)
    another_rental = Rental.create!(customer: customer, 
                                    car_category: car_category,
                                    start_date: 1.day.from_now, 
                                    end_date: 2.days.from_now)

    login_as user, scope: :user
    visit root_path
    click_on 'Locações'
    fill_in 'Código', with: rental.code
    click_on 'Buscar'

    expect(page).to have_content(rental.code)
    expect(page).not_to have_content(another_rental.code)
  end

  scenario 'and cannot be blank' do
    user = User.create!(email: 'test@test.com.br', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Locações'
    fill_in 'Código', with: ''
    click_on 'Buscar'

    expect(page).to have_content('Nenhum resultado encontrado para:')
  end

  scenario 'and code cannot be found' do
    user = User.create!(email: 'test@test.com.br', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Locações'
    fill_in 'Código', with: 'ABC123'
    click_on 'Buscar'

    expect(page).to have_content('Nenhum resultado encontrado para: ABC123')
  end
end