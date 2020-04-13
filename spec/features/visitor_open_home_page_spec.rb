require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'successfully' do
    visit root_path # sempre que vc ver metodos que terminam com _path ou _url -> é uma ROTA!

    expect(page).to have_content('Rental Cars')
    expect(page).to have_content('Bem vindo ao sistema de gestão de locação')
  end
end