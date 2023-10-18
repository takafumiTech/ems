FactoryBot.define do
  factory :user do
    center_code           {Faker::Number.number(4)}
    center_name           {"熊本"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    yearly_delivery       {Faker::Number.between(from: 0, to: 9_999_999)}
    consumption_type_id   {Faker::Number.between(from: 2, to: 4)}
  end
end