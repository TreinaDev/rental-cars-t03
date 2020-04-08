require 'rails_helper'

feature 'Visitor view manufacturers' do
  scenario 'successfully' do
    # Arrange -> 3A
    Manufacturer.create!(name: 'Fiat')
    Manufacturer.create!(name: 'Volkswagen')
    # Act
    visit root_path
    click_on 'Fabricantes'
    # Assert
    expect(page).to have_content('Fiat')
    expect(page).to have_content('Volkswagen')
  end

  scenario 'and view details' do
    Manufacturer.create!(name: 'Fiat')
    Manufacturer.create!(name: 'Volkswagen')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'

    expect(page).to have_content('Fiat')
    expect(page).not_to have_content('Volkswagen')
  end

  scenario 'and no manufacturers are created' do
    visit root_path
    click_on 'Fabricantes'

    expect(page).to have_content('Nenhum fabricante cadastrado')
  end

  scenario 'and return to home page' do
    Manufacturer.create!(name: 'Fiat')
    Manufacturer.create!(name: 'Volkswagen')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to manufacturers page' do
    Manufacturer.create!(name: 'Fiat')
    Manufacturer.create!(name: 'Volkswagen')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Voltar'

    expect(current_path).to eq manufacturers_path
  end
end
