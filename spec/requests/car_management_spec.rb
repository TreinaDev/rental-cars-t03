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

  context 'GET /api/v1/cars/:id'  do
    it 'should return one car' do
      white_car = create(:car, license_plate: 'ABC1234', color: 'Branco')
      blue_car = create(:car, license_plate: 'XYZ5678', color: 'Azul')

      get "/api/v1/cars/#{blue_car.id}"

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(blue_car.license_plate)
      expect(response.body).not_to include(white_car.license_plate)
    end

    it 'when car not found' do
      get '/api/v1/cars/000'

      expect(response).to have_http_status(:not_found)
      expect(response.body).to be_empty
    end
  end
end