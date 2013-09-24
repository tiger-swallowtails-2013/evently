require 'spec_helper'
require 'faker'

describe "Valid User" do
  it "should require email" do
    user = User.create(email: Faker::Internet.email)
    expect(user).not_to be_valid
  end

  it "should require password" do
    user = User.create(password: "password")
    expect(user).not_to be_valid
  end

  it "should not save user with duplicate email" do
    user_1 = User.create!(email: "user@example.com", password: "password")
    user_2 = User.create(email: "user@example.com", password: "password")
    expect(user_2).not_to be_valid
  end
end

describe "User SignUp" do
  it "should store valid user information in the database" do
    post '/signup', {
      :firstname => 'Rob',
      :lastname => 'Bobman',
      :email => 'rob@gmail.com',
      :password => 'password123'
    }
    expect(User.last.firstname).to eql('Rob')
    expect(User.last.lastname).to eql('Bobman')
    expect(User.last.email).to eql('rob@gmail.com')
    expect(User.last.password).to eql('password123')
  end
end






