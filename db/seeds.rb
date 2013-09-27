require 'faker'
require 'csv'

cities = []
CSV.foreach("#{APP_ROOT}/db/US.txt", {:col_sep => "\t"}) {|city| cities << ["#{city[2]}","#{city[4]}","#{city[1]}"] }


10.times do
  user = User.create(lastname: Faker::Name.last_name, firstname: Faker::Name.first_name, email: Faker::Internet.email, password: Faker::Internet.password)
  (rand(10) + 8).times do
    city = cities.sample
    event = Event.create(title: Faker::Company.catch_phrase, description: Faker::Lorem.paragraphs(1).first, location: city[0]+', '+city[1], zipcode: city[2], datetime: Time.now)
    user.events << event
  end
end

