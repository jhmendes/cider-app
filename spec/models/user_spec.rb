require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_valid(:first_name).when('John', 'Sally') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Mendes', 'Sullivan') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:email).when('user@example.com', 'another@example.com') }
  it { should_not have_valid(:email).when(nil, '', 'user@com', 'user.com') }

  it 'should have a matching password confirmation' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'
    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end

end
