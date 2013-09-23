require 'date'
ENV['RACK_ENV'] = 'test'
require 'rack/test'
require_relative './../app/models/event'

describe 'Create a New Event' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "Creates a new event with valid information" do
    Event.create(
      :title        => "DBC Hackathon",
      :description  => "Tiger Swallowtails hack together an awesome app!",
      :location     => "DBC Cave",
      :datetime     => DateTime.new(2013, 10, 31, 17,00,00)
    )
    expect(Event.last.title).to eq("DBC Hackathon")
    expect(Event.last.description).to eq("Tiger Swallowtails hack together an awesome app!")
    expect(Event.last.location).to eq("DBC Cave")
    expect(Event.last.datetime).to eq(DateTime.new(2013, 10, 31, 17,00,00))
  end

  it "Creates a new event through form" do
    post '/events', {
      :title        => "Movie Night",
      :description  => "Let's watch Inception!",
      :location     => "DBC Meadow",
      :datetime     => DateTime.new(2013, 10, 31, 17,00,00)
    }

    expect(Event.last.title).to eq("Movie Night")
  end
end