require 'rails_helper'

feature 'User view rental' do
  xscenario 'successfully' do
  end

  scenario 'cannot view unless logged in' do
    visit root_path

    expect(page).not_to have_link('Locações')
  end

  scenario 'cannot view unless logged in' do
    visit rentals_path

    expect(current_path).to eq(new_user_session_path)
  end
end