require 'spec_helper'
require 'faker'

describe "Valid user" do
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
