if Rails.env.development?
  # test user
  @user                       = User.new
  @user.name                  = "Bob Sackamano"
  @user.email                 = "test@example.com"
  @user.password              = "test"
  @user.password_confirmation = "test"
  @user.save!
  
  # test event
  @event = @user.events.create!(name: "Farmhouse Conf 5")
  
  # test venue
  @venue = @event.venues.create!(  
    name:             "The Farmhouse",
    nickname:         "FH",
    street_address:   "1558 Gordon St",
    extended_address: "",
    locality:         "Los Angeles",
    region:           "CA",
    postal_code:      "90028",
    country:          "US",
    phone:            "(555) 867-5309",
    url:              "http://farmhouse.co",
    twitter:          "farmhouse",
    instagram:        "FarmhouseLA",
    facebook:         "FarmhouseCO"
  )  
end
