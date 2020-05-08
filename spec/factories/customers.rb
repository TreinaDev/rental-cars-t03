FactoryBot.define do
  factory :customer do
    name { 'John Doe' }
    document { CPF.generate(formated: true) }
    sequence(:email) { |n| "customer#{n}@test.com.br" }
  end
end