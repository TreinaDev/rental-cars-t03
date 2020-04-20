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

  scenario 'view item details' do
    
  end

  scenario 'empty list' do

  end
end