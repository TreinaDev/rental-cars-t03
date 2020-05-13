require 'rails_helper'

describe 'Car management' do
  context 'GET /api/v1/cars' do
    it 'returns cars' do
      cars = create_list(:car, 3)

      get api_v1_cars_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(cars.first.license_plate)
      expect(response.body).to include(cars.second.license_plate)
      expect(response.body).to include(cars.third.license_plate)
    end
  end
end