require 'rails_helper'

feature 'Admin manages subsidiary' do
  context 'index' do
    scenario 'must be signed in' do
      visit root_path
      visit subsidiaries_path

      expect(current_path).to eq new_user_session_path
    end

    scenario 'view all subsidiaries' do
      Subsidiary.create!(name: 'Paulista', address: 'Av Paulista, 1000',
                         cnpj: '08.285.486/0001-63')

      Subsidiary.create!(name: 'Cuiabá', address: 'Avenida do Comércio, 50',
                         cnpj: '07.553.845/0001-53')

      user = User.create!(email: 'joao@email.com', password: '12345678')

      login_as user, scope: :user
      visit root_path
      click_on 'Filiais'

      within('table#filiais') do
        expect(page).to have_content 'Paulista'
        expect(page).to have_content 'Av Paulista, 1000'

        expect(page).to have_content 'Cuiabá'
        expect(page).to have_content 'Avenida do Comércio, 50'
      end
    end

    scenario 'view all subsidiaries' do
      user = User.create!(email: 'joao@email.com', password: '12345678')

      login_as user, scope: :user
      visit root_path
      click_on 'Filiais'

      expect(page).to have_content 'Nenhuma filial cadastrada'
    end
  end

  context 'show' do
    scenario 'must be signed in' do
      visit subsidiary_path(0)

      expect(current_path).to eq new_user_session_path
    end

    scenario 'view details' do
      Subsidiary.create!(name: 'Cuiabá', address: 'Avenida do Comércio, 50',
                         cnpj: '07.553.845/0001-53')

      user = User.create!(email: 'joao@email.com', password: '12345678')

      login_as user, scope: :user
      visit root_path
      click_on 'Filiais'
      click_on 'Cuiabá'


      expect(page).to have_content 'Cuiabá'
      expect(page).to have_content 'Avenida do Comércio, 50'
      expect(page).to have_content '07.553.845/0001-53'
    end
  end

  context 'create' do
    scenario 'must be signed in' do
      visit new_subsidiary_path

      expect(current_path).to eq new_user_session_path
    end

    scenario 'successfully' do
      user = User.create!(email: 'joao@email.com', password: '12345678')

      login_as(user, scope: :user)
      visit root_path
      click_on 'Filiais'
      click_on 'Cadastrar Nova Filial'
      fill_in 'Nome', with: 'Copacabana'
      fill_in 'Endereço', with: 'Av Nossa Senhora de Copacabana, 100'
      fill_in 'CNPJ', with: '77.658.541/0001-36'
      click_on 'Criar Filial'

      expect(page).to have_content 'Filial Copacabana'
      expect(page).to have_content 'Endereço: Av Nossa Senhora de Copacabana, 100'
      expect(page).to have_content 'CNPJ: 77.658.541/0001-36'
    end

    scenario 'must fill in all fields' do
      user = User.create!(email: 'joao@email.com', password: '12345678')

      login_as(user, scope: :user)
      visit root_path
      click_on 'Filiais'
      click_on 'Cadastrar Nova Filial'
      fill_in 'Nome', with: ''
      fill_in 'Endereço', with: ''
      fill_in 'CNPJ', with: ''
      click_on 'Criar Filial'

      expect(page).to have_content('Não foi possível cadastrar a filial')
      expect(page).to have_css('div#errors li', count: 5)
    end
  end

  context 'update' do
    scenario 'must be signed in' do
      visit edit_subsidiary_path(0)

      expect(current_path).to eq new_user_session_path
    end

    scenario 'successfully' do
      user = User.create!(email: 'joao@email.com', password: '12345678')
      subsidiary = Subsidiary.create!(name: 'Test', address: 'test',
                                      cnpj: '83.037.643/3947-55')

      login_as(user, scope: :user)
      visit root_path
      click_on 'Filiais'
      click_on subsidiary.name
      click_on 'Atualizar filial'
      fill_in 'Nome', with: 'Copacabana'
      fill_in 'Endereço', with: 'Av Nossa Senhora de Copacabana, 100'
      fill_in 'CNPJ', with: '77.658.541/0001-36'
      click_on 'Atualizar Filial'

      expect(page).to have_content 'Filial Copacabana'
      expect(page).to have_content 'Endereço: Av Nossa Senhora de Copacabana, 100'
      expect(page).to have_content 'CNPJ: 77.658.541/0001-36'
    end

    scenario 'must fill in all fields' do
      user = User.create!(email: 'joao@email.com', password: '12345678')
      subsidiary = Subsidiary.create!(name: 'Test', address: 'test',
                                      cnpj: '83.037.643/3947-55')

      login_as(user, scope: :user)
      visit edit_subsidiary_path(subsidiary)
      fill_in 'Nome', with: ''
      fill_in 'Endereço', with: ''
      fill_in 'CNPJ', with: ''
      click_on 'Atualizar Filial'

      expect(page).to have_content('Não foi possível cadastrar a filial')
      expect(page).to have_css('div#errors li', count: 5)
    end
  end
end
