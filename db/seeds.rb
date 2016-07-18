if Rails.env.development?
  puts "# creating test user"
  @user                       = User.new
  @user.name                  = "Bob Sackamano"
  @user.email                 = "test@example.com"
  @user.password              = "test"
  @user.password_confirmation = "test"
  @user.save!

  puts "# creating test event"
  @event = @user.events.create!(name: "Farmhouse Conf 5")

  puts "# creating test venue"
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

  puts "# creating test venue"
  @location = @venue.locations.create!(
    name: "Under the Avocado Tree",
  )

  puts "# creating test performance"
  @performance = @event.performances.create!(
    name:        "The Collapse of Love in the Age of Machines",
    description: "When it comes to love, we might all be Luddites. Wouldn’t we smash the machine that told us precisely where and when our former paramours found someone new? Unfortunately, the global index that contains every gossamer byte of the love letters we're always unwittingly writing as we make contact across the web is quite unsmashable. We are at a fundamental cultural tipping point in how we deal with love, courtship&mdashand inevitably, heartbreak. Is this the collapse of love as we know it? How do we renegotiate intimacy in the Internet age?",
    starts_at:   Time.parse("2013-11-02 18:30"),
    ends_at:     Time.parse("2013-11-02 19:00")
  )

  @performance.location = @location
  @performance.save!

  puts "# creating test person"
  bio = "
    <a href='http://www.clairelevans.com' title='Claire L. Evans — STAMP OUT REALITY'>Claire L. Evans</a> is a writer and artist working in Los Angeles, California. Her “day job” is as the singer and co-author of the conceptual disco-pop band <a href='http://teamyacht.com' title='YACHT △ Hello'>YACHT</a>. A science journalist and science-fiction critic, she is a regular contributor to Aeon Magazine, Vice, Motherboard, and Grantland, and is the editor-in-chief of <a href='http://omnireboot.com' title='Omni Reboot'>OMNI Reboot</a>.
    Her writing has been was anthologized in <a href='http://www.amazon.com/Best-Science-Writing-Online-Laboratory/dp/B00DJZIEHE' title='The Best Science Writing Online 2012 (Open Laboratory): Jennifer Ouellette, Bora Zivkovic: 0971486646597: Amazon.com: Books'>Best Science Writing Online 2012</a> (Scientific American Books/Farrar, Straus &amp; Giroux), and she regularly participates in panels, conferences, and screenings on the subject of science and culture. She has performed earnestly cosmic presentations at the Kitchen, MoMA PS1, and the Hirshhorn Museum, spoken about extraterrestrial life at the Rubin Museum’s BRAINWAVE series, and co-authored a book on interdisciplinarity in the arts, <a href='http://millergallery.cfa.cmu.edu/nasabook/' title='New Art/Science Affinities book &gt;Miller Gallery at Carnegie Mellon University'>NA/SA: New Art Science Affinities</a>.
    A collected book of her essays, <a href='http://www.publicationstudio.biz/books/215' title='Publication Studio  –  Books  –  215'>High Frontiers</a>, is now available from Publication Studio.
  "

  @person = @event.people.create!(
    name:      "Claire Evans",
    photo:     "http://farmhouse.s3.amazonaws.com/images/speakers/claire-evans.jpg",
    bio:       "bio",
    url:       "http://www.clairelevans.com",
    twitter:   "theuniverse",
    instagram: "clairelevans",
    facebook:  "claire",
    youtube:   "yacht",
    vimeo:     "yacht",
    bandcamp:  "yacht"
  )

  @person.performances << @performance
end
