FactoryBot.define do
  factory :management do
    item_name               {"段ボール"}
    unit                    {Faker::Number.between(from: 0, to: 9_999_999)}
    lead_time               {Faker::Number.between(from: 0, to: 9_999_999)}
    current_amount          {Faker::Number.between(from: 0, to: 9_999_999)}
    spare                   {Faker::Number.between(from: 0, to: 9_999_999)}
    consumption_by_delivery {0.01}
    consumption_by_repair   {0.0003}
    consumption_by_exchange {4}
    association :user
  end
end