FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    first_name 'John'
    last_name 'Mendes'
    password 'mypassword'
    password_confirmation 'mypassword'
  end



  factory :cider do
    sequence(:company) { |n| "mycider#{n}"}
    style 'Amber'
    abv '5.5%'
    season 'Year Round'
    description 'This is my cider description.  It needs to be a minimum of 50 characters long to be valid.'
  end

end
