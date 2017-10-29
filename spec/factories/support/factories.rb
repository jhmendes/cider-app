FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    first_name 'John'
    last_name 'Mendes'
    password 'mypassword'
    password_confirmation 'mypassword'
  end
end
