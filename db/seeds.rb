require 'faker'

10.times do
  user = User.create(lastname: Faker::Name.last_name, firstname: Faker::Name.first_name, email: Faker::Internet.email, password: Faker::Internet.password)
  (rand(10) + 8).times do
    event = Event.create(title: Faker::Company.catch_phrase, description: Faker::Lorem.paragraphs(1).first, location: Faker::Address.city + ", " + Faker::Address.state, datetime: Time.now)
    user.events << event
  end
end

