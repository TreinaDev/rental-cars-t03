FactoryBot.define do
  factory :rental do
    customer
    car_category
    start_date { 1.day.from_now }
    end_date { 3.day.from_now }
  end
end