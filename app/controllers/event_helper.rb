helpers do

  def geo_lookup(address)
    geocode = Geocoder.search(address).first
    {:latitude => geocode.latitude, :longitude => geocode.longitude}
  end

end