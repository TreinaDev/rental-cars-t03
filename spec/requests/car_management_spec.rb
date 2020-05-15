require 'rails_helper'

describe 'Car management' do
  context 'GET /api/v1/cars' do
    it 'returns cars' do
      cars = create_list(:car, 3)

      get api_v1_cars_path

      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:ok)
      expect(json_response[0][:license_plate]).to eq(cars.first.license_plate)
      expect(json_response.second[:license_plate]).to eq(cars.first.license_plate)
      expect(response.body).to include(cars.third.license_plate)
    end

    it 'returns empty array without cars' do
      get api_v1_cars_path
      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response).to be_empty
    end
  end
end