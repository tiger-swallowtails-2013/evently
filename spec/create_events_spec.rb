require 'date'
ENV['RACK_ENV'] = 'test'
require 'rack/test'
require_relative './../app/models/event'
require_relative './../app/models/guest'
require_relative './../app/models/user'

describe 'Create a New Event' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "Creates a new event with valid information" do
    event = Event.new(
      :title        => "DBC Hackathon",
      :description  => "Tiger Swallowtails hack together an awesome app!",
      :location     => "DBC Cave",
      :datetime     => DateTime.new(2013, 10, 31, 17,00,00)
    )
    User.create(
      :firstname => "Max",
      :lastname => "Johnson",
      :email => "max@gmail.com",
      :password => 'pw')
    event.user = User.last
    event.save
    expect(Event.last.title).to eq("DBC Hackathon")
    expect(Event.last.description).to eq("Tiger Swallowtails hack together an awesome app!")
    expect(Event.last.location).to eq("DBC Cave")
    expect(Event.last.datetime).to eq(DateTime.new(2013, 10, 31, 17,00,00))
    expect(Event.last.user).to eq(User.last)
  end

  it "Creates a new event through form" do
    post '/events/create', {
      :title        => "Movie Night",
      :desc         => "Let's watch Inception!",
      :location     => "DBC Meadow",
      :date         => '2013-10-31',
      :time         => "15:00"
    }, 'rack.session' => {user_id:User.last.id}

    expect(Event.last.title).to eq("Movie Night")
    expect(Event.last.description).to eq("Let's watch Inception!")
    expect(Event.last.location).to eq("DBC Meadow")
    expect(Event.last.datetime).to eq(DateTime.new(2013,10,31,15,00,00))
  end
end

describe 'Guests can RSVP' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
  it "Creates a new guest with valid information" do
    new_guest = Guest.create(
      :name => 'John',
      :email=> 'john@gmail.com',
      :rsvp? => true)
    new_guest.event = Event.first
    new_guest.save

  expect(Guest.last.name).to eq('John')
  expect(Guest.last.email).to eq('john@gmail.com')
  expect(Guest.last.rsvp?).to eq(true)
  expect(Guest.last.event).to eq(Event.first)
  end

  it "Creates a new guest with valid information through form" do
    post "/events/#{Event.last.id}", {
      :name => 'Michael',
      :email => 'Michael@gmail.com',
      :rsvp => 'false'
    }

  expect(Guest.last.name).to eq('Michael')
  expect(Guest.last.email).to eq('Michael@gmail.com')
  expect(Guest.last.rsvp?).to eq(false)
  expect(Guest.last.event).to eq(Event.last)
  end




end

