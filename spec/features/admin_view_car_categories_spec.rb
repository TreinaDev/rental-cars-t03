require 'rails_helper'

feature 'Admin view car categories' do
  scenario 'successfully' do
    # Arrange
    CarCategory.create!(name: 'A', daily_rate: 50)
    CarCategory.create!(name: 'B', daily_rate: 70)

    # Act
    visit root_path
    click_on 'Categorias de Carros'

    # Assert
    expect(page).to have_content 'Categoria A'
    expect(page).to have_content 'R$ 50,00'
    
    expect(page).to have_content 'Categoria B'
    expect(page).to have_content 'R$ 70,00'
  end

  scenario 'view car category details' do
    # Arrange
    CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 40, third_part_insurance: 30)

    # Act
    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Categoria A'

    # Assert
    expect(page).to have_css('header h1', text: 'Categoria A')
    expect(page).to have_content('Diária: R$ 50,00')
    expect(page).to have_content('Seguro do Carro: R$ 40,00')
    expect(page).to have_content('Seguro para Terceiros: R$ 30,00')
    expect(page).to have_css('dd:nth-of-type(1)', text: 'R$ 50,00')
    expect(page).to have_css('dd:nth-of-type(2)', text: 'R$ 40,00')
    expect(page).to have_css('dd:nth-of-type(3)', text: 'R$ 30,00')
  end

  scenario 'empty list' do

  end
end