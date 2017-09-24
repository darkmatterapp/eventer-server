if Rails.env.development?
  puts "#" * 80
  puts "# creating test user"
  @user                       = User.new
  @user.name                  = "Bob Sackamano"
  @user.email                 = "test@example.com"
  @user.password              = "test"
  @user.password_confirmation = "test"
  @user.save!

  puts "# creating test event"
  @event = @user.events.create!(
    name: "Farmhouse Conf",
    start_date: Date.today,
    end_date: Date.today + 3,
    time_zone: "Pacific Time (US & Canada)",
    city: "Hollywood",
    state: "CA",
    iterator: "5",
    summary: "Stories About The Collapse Under an Avocado Tree in Hollywood, California",
    description: "Farmhouse Conf 5 is the fifth and final show of Hollywood’s best backyard storytelling conference. 1 day / 1 track, 8 speakers (3 men / 5 women), no slides, no projectors. Amazing people telling incredible stories of Collapse.\n\nThe event brings together people from a variety of backgrounds and influences. The big vision is to get amazing people together, inspire them, give them time and space to cross pollinate... then watch what great things come from it.\n\nFHC5 will invite back all past speakers and bands to come back and be a part of the reunion / farewell show.\n\nAttendees are welcome to camp in the backyard if you bring your own gear (tent, sleeping bag, etc). All the food and drinks are provided during the day and night. After the day of talks, we party into the night with live music, free booze and tasty treats.",
    twitter: "farmhouse",
    instagram: "FarmhouseLA",
    facebook: "FarmhouseCO",
    code_of_conduct: "Our Pledge\n\nIn the interest of fostering an open and welcoming environment, we as contributors and maintainers pledge to making participation in our project and our community a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.\n\nOur Standards\n\nExamples of behavior that contributes to creating a positive environment include:\n\n* Using welcoming and inclusive language\n* Being respectful of differing viewpoints and experiences\n* Gracefully accepting constructive criticism\n* Focusing on what is best for the community\n* Showing empathy towards other community members\n\nExamples of unacceptable behavior by participants include:\n\n* The use of sexualized language or imagery and unwelcome sexual attention or advances\n* Trolling, insulting/derogatory comments, and personal or political attacks\n* Public or private harassment\n* Publishing others&rsquo; private information, such as a physical or electronic address, without explicit permission\n* Other conduct which could reasonably be considered inappropriate in a professional setting\n\nOur Responsibilities\n\nProject maintainers are responsible for clarifying the standards of acceptable behavior and are expected to take appropriate and fair corrective action in response to any instances of unacceptable behavior.\n\nProject maintainers have the right and responsibility to remove, edit, or reject comments, commits, code, wiki edits, issues, and other contributions that are not aligned to this Code of Conduct, or to ban temporarily or permanently any contributor for other behaviors that they deem inappropriate, threatening, offensive, or harmful.\n\nScope\n\nThis Code of Conduct applies both within project spaces and in public spaces when an individual is representing the project or its community. Examples of representing a project or community include using an official project e-mail address, posting via an official social media account, or acting as an appointed representative at an online or offline event. Representation of a project may be further defined and clarified by project maintainers.\n\nEnforcement\n\nInstances of abusive, harassing, or otherwise unacceptable behavior may be reported by contacting the project team at test@example.com. All complaints will be reviewed and investigated and will result in a response that is deemed necessary and appropriate to the circumstances. The project team is obligated to maintain confidentiality with regard to the reporter of an incident. Further details of specific enforcement policies may be posted separately.\n\nProject maintainers who do not follow or enforce the Code of Conduct in good faith may face temporary or permanent repercussions as determined by other members of the project's leadership.\n\nAttribution\n\nThis Code of Conduct is adapted from the Contributor Covenant, version 1.4, available at https://www.contributor-covenant.org/version/1/4/code-of-conduct.html"
  )

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

  puts "# creating test session"
  @session = @event.sessions.create!(
    name:        "The Collapse of Love in the Age of Machines",
    description: "When it comes to love, we might all be Luddites. Wouldn’t we smash the machine that told us precisely where and when our former paramours found someone new? Unfortunately, the global index that contains every gossamer byte of the love letters we're always unwittingly writing as we make contact across the web is quite unsmashable. We are at a fundamental cultural tipping point in how we deal with love, courtship&mdashand inevitably, heartbreak. Is this the collapse of love as we know it? How do we renegotiate intimacy in the Internet age?",
    starts_at:   Time.parse("2013-11-02 18:30"),
    ends_at:     Time.parse("2013-11-02 19:00")
  )

  @session.location = @location
  @session.save!

  puts "# creating test participant"
  bio = "
    <a href='http://www.clairelevans.com' title='Claire L. Evans — STAMP OUT REALITY'>Claire L. Evans</a> is a writer and artist working in Los Angeles, California. Her “day job” is as the singer and co-author of the conceptual disco-pop band <a href='http://teamyacht.com' title='YACHT △ Hello'>YACHT</a>. A science journalist and science-fiction critic, she is a regular contributor to Aeon Magazine, Vice, Motherboard, and Grantland, and is the editor-in-chief of <a href='http://omnireboot.com' title='Omni Reboot'>OMNI Reboot</a>.
    Her writing has been was anthologized in <a href='http://www.amazon.com/Best-Science-Writing-Online-Laboratory/dp/B00DJZIEHE' title='The Best Science Writing Online 2012 (Open Laboratory): Jennifer Ouellette, Bora Zivkovic: 0971486646597: Amazon.com: Books'>Best Science Writing Online 2012</a> (Scientific American Books/Farrar, Straus &amp; Giroux), and she regularly participates in panels, conferences, and screenings on the subject of science and culture. She has performed earnestly cosmic presentations at the Kitchen, MoMA PS1, and the Hirshhorn Museum, spoken about extraterrestrial life at the Rubin Museum’s BRAINWAVE series, and co-authored a book on interdisciplinarity in the arts, <a href='http://millergallery.cfa.cmu.edu/nasabook/' title='New Art/Science Affinities book &gt;Miller Gallery at Carnegie Mellon University'>NA/SA: New Art Science Affinities</a>.
    A collected book of her essays, <a href='http://www.publicationstudio.biz/books/215' title='Publication Studio  –  Books  –  215'>High Frontiers</a>, is now available from Publication Studio.
  "

  @participant = @event.participants.create!(
    name:      "Claire Evans",
    photo:     "http://farmhouse.s3.amazonaws.com/images/speakers/claire-evans.jpg",
    bio:       bio,
    url:       "http://www.clairelevans.com",
    twitter:   "theuniverse",
    instagram: "clairelevans",
    facebook:  "claire",
    youtube:   "yacht",
    vimeo:     "yacht",
    bandcamp:  "yacht"
  )

  puts "# creating test role"
  @role = @event.roles.create!(
    name: "Speaker",
    description: "The participant with the mic in front of everyone."
  )

  puts "# creating test participation (event + session + participant + role)"
  @participation = Participation.create!(
    event: @event,
    session: @session,
    participant: @participant,
    role: @role
  )

  puts "#" * 80
end
