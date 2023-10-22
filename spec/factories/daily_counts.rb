FactoryBot.define do
  factory :daily_count do
    date           {Faker::Date.birthday}
    delivery_count {Faker::Number.between(from: 0, to: 9_999_999)}
    repair_count   {Faker::Number.between(from: 0, to: 9_999_999)}
    exchange_count {Faker::Number.between(from: 0, to: 9_999_999)}
    association :user
  end
end
