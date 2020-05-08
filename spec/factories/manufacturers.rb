FactoryBot.define do
  factory :manufacturer do
    sequence(:name) { |n| "Fabricante#{n}" }
  end
end