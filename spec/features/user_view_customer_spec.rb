require 'rails_helper'

feature 'User view customer' do
  xscenario 'and view multiple customers' do
  end

  xscenario 'and view customer details' do
    within "tr#rental-#{rental.code}" do
      click_on 'Iniciar'
    end
  end

  xscenario 'without rentals' do
    expect(page).to_not have_link('Iniciar')
  end
end