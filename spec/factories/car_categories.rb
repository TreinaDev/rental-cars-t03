FactoryBot.define do
  factory :car_category do
    name { 'A' }
    daily_rate { 100 }
    car_insurance { 100 }
    third_part_insurance { 100 }
  end
end