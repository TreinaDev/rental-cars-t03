FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@test.com.br" }
    password { '12345678' }
    role { :user }

    trait :admin do
      role { :admin }
    end
  end
end