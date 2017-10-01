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
  start_date: "2018-11-02",
  end_date: "2018-11-02",
  email: "barn@farmhouse.co",
  time_zone: "Pacific Time (US & Canada)",
  city: "Hollywood",
  state: "CA",
  iterator: "5",
  summary: "Stories About The Collapse Under an Avocado Tree in Hollywood, California",
  description: "Farmhouse Conf 5 is the fifth and final show of Hollywood’s best backyard storytelling conference. 1 day / 1 track, 8 speakers (3 men / 5 women), no slides, no projectors. Amazing people telling incredible stories of Collapse.\r\n\r\nThe event brings together people from a variety of backgrounds and influences. The big vision is to get amazing people together, inspire them, give them time and space to cross pollinate... then watch what great things come from it.\r\n\r\nFHC5 will invite back all past speakers and bands to come back and be a part of the reunion / farewell show.\r\n\r\nAttendees are welcome to camp in the backyard if you bring your own gear (tent, sleeping bag, etc). All the food and drinks are provided during the day and night. After the day of talks, we party into the night with live music, free booze and tasty treats.",
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
@location1 = @venue.locations.create!(name: "Under the Avocado Tree")
@location2 = @venue.locations.create!(name: "In the Old Barn")

puts "# creating test role"
@role = @event.roles.create!(
  name: "Speaker",
  description: "The participant with the mic in front of everyone."
)

puts "# creating test sessions"

@event.sessions.create!(
  name:        "Registration / Breakfast",
  starts_at:   Time.parse("2018-11-02 08:00"),
  ends_at:     Time.parse("2018-11-02 09:00"),
  location:    @location1
)

@session1 = @event.sessions.create!(
  name:        "The Collapse of Love in the Age of Machines",
  description: "When it comes to love, we might all be Luddites. Wouldn’t we smash the machine that told us precisely where and when our former paramours found someone new? Unfortunately, the global index that contains every gossamer byte of the love letters we're always unwittingly writing as we make contact across the web is quite unsmashable. We are at a fundamental cultural tipping point in how we deal with love, courtship &mdash; and inevitably, heartbreak. Is this the collapse of love as we know it? How do we renegotiate intimacy in the Internet age?",
  starts_at:   Time.parse("2018-11-02 09:00"),
  ends_at:     Time.parse("2018-11-02 10:00"),
  location:    @location2
)

@session2 = @event.sessions.create!(
  name:        "Near-Term Collapse: Why Industrial Society Is More Vulnerable Than You May Think",
  description: "Rising energy costs, crushing debt burdens, resource depletion, and climate change are converging to undermine the global economy. Our political system appears incapable of responding. Previous civilizations have collapsed in the face of similar challenges. What does collapse look like? Is it likely within the next two decades? If so, what should we be doing?",
  starts_at:   Time.parse("2018-11-02 10:00"),
  ends_at:     Time.parse("2018-11-02 11:00"),
  location:    @location1
)

@session3 = @event.sessions.create!(
  name:        "The Collapse of The Personal/Professional Separation",
  description: "Why would you tell 70,000 strangers your every waking thought? What effect does over-sharing have on your career. Does anyone care about your shitty tattoos in the workplace anymore? What would happen if you could just be yourself, unfiltered, all the time?",
  starts_at:   Time.parse("2018-11-02 11:00"),
  ends_at:     Time.parse("2018-11-02 12:00"),
  location:    @location2
)

@event.sessions.create!(
  name:        "Lunch",
  starts_at:   Time.parse("2018-11-02 12:00"),
  ends_at:     Time.parse("2018-11-02 13:00"),
  location:    @location1
)

@session4 = @event.sessions.create!(
  name:        "Resilience in the Face of Total Collapse",
  description: "Every end collapse marks a new beginning. But where does momentum to start something new come from? Where does resilence originate?\n\nI want to tell you all my own story of personal resilience and how the best of things can come from the worst of situations. Or, how I learned to take power away from those who thrive on negativity and conflict and use it to create beautfiul movements of empowerment for those of us who deserve a better world.",
  starts_at:   Time.parse("2018-11-02 13:00"),
  ends_at:     Time.parse("2018-11-02 14:00"),
  location:    @location2
)

@session5 = @event.sessions.create!(
  name:        "The Collapse of Trust",
  description: "When we think about collapse, the narrative that comes to mind is that of the massive environmental challenges facing us as a species, as we attempt to recover from variously boiling, acid-bathing, and poisoning ourselves. Just as real, though, is the collapse of trust that's led us to be on such a direct collision path with the end of our future. We have placed a trust in our governments to act in our interests and in our institutions to think on the kind of timescales that lone individuals often fail to, but that trust has completely collapsed. The problem of ecological collapse in the large is really a failure of governance and timescale, an issue of state capture, a failure of fundamental ethics and vision on the part of the super-empowered, a systemic, emergent nightmare.\n\nLet's walk into that nightmare, sit with it for a while, and then see how we can walk back out.",
  starts_at:   Time.parse("2018-11-02 14:00"),
  ends_at:     Time.parse("2018-11-02 15:00"),
  location:    @location1
)

@session6 = @event.sessions.create!(
  name:        "Collapse of an Education System Not Designed for Creativity",
  description: "Nirvan discovered a 9 year old kid named Caine who had made an arcade out of cardboard at an auto parts store. Nirvan bought a fun pass and his life was changed. He organized a flash mob to visit Caine's Arcade on one day and changed Caine's life. Nirvan made a short film about the whole experience. And then both of their lives changed. They went from arcade to movie to global movement of kids making amazing things out of cardboard. From there, The Imagination Foundation launched, bringing creativity to classrooms and communities by unplugging for a day to play.",
  starts_at:   Time.parse("2018-11-02 15:00"),
  ends_at:     Time.parse("2018-11-02 16:00"),
  location:    @location2
)

@session7 = @event.sessions.create!(
  name:        "Gravitational Collapse, Energetic Wheels, Ape Locomotion: a history",
  description: "A quick look at strategies used by the genus Homo to enhance and extend the joy of mobility past and present. Starting with the evolution of bipedalism and the radical growth of the brain, I will catalog what I see as the most important behaviors, capacities and inventions that propelled humans into the now..., and I will demonstrate where I think we are going next.",
  starts_at:   Time.parse("2018-11-02 17:00"),
  ends_at:     Time.parse("2018-11-02 18:00"),
  location:    @location1
)

@session8 = @event.sessions.create!(
  name:        "The Collapse of Hope & Letting Go of What Could Have Been",
  description: "Launching our big ideas into the world takes courage & moxy. We dive in, our eyes twinkling with possibility and hope, and if we’re lucky we catalyze collaborators, supportive fans, customers and a community along the way. But what happens when you’ve lost that loving feeling? Or when you realize it’s time to let go of the baby you’ve put your blood, sweat & tears into and move on? Letting go of what could have been may just take more courage & moxy than getting the idea off the ground in the first place.",
  starts_at:   Time.parse("2018-11-02 18:00"),
  ends_at:     Time.parse("2018-11-02 19:00"),
  location:    @location2
)

@event.sessions.create!(
  name:        "PARTY TIME!!",
  starts_at:   Time.parse("2018-11-02 19:00"),
  ends_at:     Time.parse("2018-11-02 23:00"),
  location:    @location1
)

puts "# creating test participants"

@participant1 = @event.participants.create!(
  name:      "Claire Evans",
  photo:     "http://farmhouse.s3.amazonaws.com/images/speakers/claire-evans.jpg",
  bio:       "<a href='http://www.clairelevans.com' title='Claire L. Evans — STAMP OUT REALITY'>Claire L. Evans</a> is a writer and artist working in Los Angeles, California. Her “day job” is as the singer and co-author of the conceptual disco-pop band <a href='http://teamyacht.com' title='YACHT △ Hello'>YACHT</a>. A science journalist and science-fiction critic, she is a regular contributor to Aeon Magazine, Vice, Motherboard, and Grantland, and is the editor-in-chief of <a href='http://omnireboot.com' title='Omni Reboot'>OMNI Reboot</a>.\n\nHer writing has been was anthologized in <a href='http://www.amazon.com/Best-Science-Writing-Online-Laboratory/dp/B00DJZIEHE' title='The Best Science Writing Online 2012 (Open Laboratory): Jennifer Ouellette, Bora Zivkovic: 0971486646597: Amazon.com: Books'>Best Science Writing Online 2012</a> (Scientific American Books/Farrar, Straus &amp; Giroux), and she regularly participates in panels, conferences, and screenings on the subject of science and culture. She has performed earnestly cosmic presentations at the Kitchen, MoMA PS1, and the Hirshhorn Museum, spoken about extraterrestrial life at the Rubin Museum’s BRAINWAVE series, and co-authored a book on interdisciplinarity in the arts, <a href='http://millergallery.cfa.cmu.edu/nasabook/' title='New Art/Science Affinities book &gt;Miller Gallery at Carnegie Mellon University'>NA/SA: New Art Science Affinities</a>.\n\nA collected book of her essays, <a href='http://www.publicationstudio.biz/books/215' title='Publication Studio  –  Books  –  215'>High Frontiers</a>, is now available from Publication Studio.",
  url:       "http://www.clairelevans.com",
  twitter:   "theuniverse",
  instagram: "clairelevans",
  facebook:  "claire",
  youtube:   "yacht",
  vimeo:     "yacht",
  bandcamp:  "yacht"
)

@participant2 = @event.participants.create!(
  name:      "Richard Heinberg",
  photo:     "http://farmhouse.s3.amazonaws.com/images/speakers/richard-heinberg.jpg",
  bio:       %^<p>Richard Heinberg is the author of ten books including:</p>
              <ul><li><i>The End of Growth</i> (August 2011)</li><li><i>The Post Carbon Reader</i> (2010) (editor)</li><li><i>Blackout: Coal, Climate, and the Last Energy Crisis</i> (2009)</li><li><i>Peak Everything: Waking Up to the Century of Declines</i> (2007)</li><li><i>The Oil Depletion Protocol: A Plan to Avert Oil Wars, Terrorism &amp; Economic Collapse</i> (2006)</li><li><i>Powerdown: Options &amp; Actions for a Post-Carbon World</i> (2004)</li><li><i>The Party's Over: Oil, War &amp; the Fate of Industrial Societies</i> (2003)</li></ul>
              <p>Richard is a Senior Fellow of the Post Carbon Institute and is widely regarded as one of the world&rsquo;s foremost Peak Oil educators. He has authored scores of essays and articles that have appeared in such journals as Nature, The American Prospect, Public Policy Research, Quarterly Review, The Ecologist, Resurgence, The Futurist, European Business Review, Earth Island Journal, Yes!, and The Sun; and on web sites such as <a href="http://EnergyBulletin.net" title="Resilience.org">EnergyBulletin.net</a>, <a href="http://TheOilDrum.com" title="The Oil Drum | Discussions about Energy and Our Future">TheOilDrum.com</a>, <a href="http://Alternet.org" title="Alternet | Alternative News and Information">Alternet.org</a>, <a href="http://ProjectCensored.com" title="ProjectCensored.com: The Leading Human Rights Site on the Net">ProjectCensored.com</a>, and <a href="http://Counterpunch.com" title="Counterpunch: Tells the Facts, Names the Names">Counterpunch.com</a>.</p>
              <p>He has been quoted in Time Magazine and has spoken to hundreds of audiences in 14 countries, including members of the European Parliament.  He has appeared in many film and television documentaries, including Leonardo DiCaprio&rsquo;s 11th Hour, is a recipient of the M. King Hubbert Award for Excellence in Energy Education, and in 2012 was appointed to His Majesty the King of Bhutan's International Expert Working Group for the New Development Paradigm initiative.</p>
              <p>Richard&rsquo;s animations <a href='http://www.youtube.com/watch?v=4uKgU7krWzE' title=\"DON'T WORRY, DRIVE ON: Fossil Fools &amp; Fracking Lies\"><i>Don&rsquo;t Worry, Drive On</i></a>, <a href=\"http://www.youtube.com/watch?v=EQqDS9wGsxQ\" title='Who Killed Economic Growth?'><i>Who Killed Economic Growth?</i></a> and <a href='http://www.youtube.com/watch?v=cJ-J91SwP8w' title='300 Years of FOSSIL FUELS in 300 Seconds'><i>300 Years of Fossil Fuels in 300 Minutes</i></a> (winner of a YouTubes&rsquo;s/DoGooder Video of the Year Award) have been viewed by 1.5 million people.</p>
              <p>Since 2002, he has delivered more than four hundred lectures to a wide variety of audiences &mdash; from insurance executives to peace activists, from local and national elected officials to Jesuit volunteers.</p>^,
  url:       "http://richardheinberg.com",
  twitter:   "richardheinberg",
  instagram: "richardheinberg",
  facebook:  "richardheinberg"
)

@participant3 = @event.participants.create!(
  name:      "Jessica Hische",
  photo:     "http://farmhouse.s3.amazonaws.com/images/speakers/jessica-hische.jpg",
  bio:       %^<p><a href="http://jessicahische.is" title="Jessica Hische">Jessica Hische</a> is a letterer, illustrator, and self-described &ldquo;avid internetter&rdquo;. After graduating with a degree in Graphic and Interactive Design from Tyler School of Art (Temple University) in 2006, she worked for Headcase Design in Philadelphia before taking a position as Senior Designer at Louise Fili Ltd. While working for Louise, she learned most of her skills as a letterer and spent upwards of 16 hours every day working (9 for Louise, 7+ for freelance clients). After two and a half years, Jessica left to further her freelance career and embark on several fun personal projects. Jessica began <a href="http://www.dailydropcap.com" title="Daily Drop Cap">Daily Drop Cap</a>, a project in which every day she created a new illustrative letter, working through the alphabet a total of twelve times. At its peak, the site had more than 100,000 visitors per month. It culminated with a thirteenth alphabet, each letter crafted by a guest contributor.</p>
               <p>Jessica has become as well known for her side projects as she has for her client work. While she doesn&rsquo;t consider herself a web designer, many of her personal projects are web-centric. She&rsquo;s created several educational micro-sites including <a href="http://www.momthisishowtwitterworks.com" title="Mom This is How Twitter Works">Mom This is How Twitter Works</a>, <a href="http://shouldiworkforfree.com" title="Should I Work for Free?">Should I Work for Free?</a> and <a href="http://www.dontfeartheinternet.com" title="Don&rsquo;t Fear the Internet">Don&rsquo;t Fear the Internet</a> (with Russ Maschmeyer), each as entertaining as they are helpful. She coined the term &ldquo;<a href="http://jessicahische.is/aprocrastiworker" title="Jessica Hische - Side Projects">procrastiworking</a>&rdquo; to describe her tendency to procrastinate on client work by working on personal projects.</p>
               <p>Jessica's clients includes Wes Anderson, Tiffany &amp; Co., The New York Times, Penguin Books, Target, Leo Burnett, American Express, and Wired Magazine. She has also released several commercial typefaces which are available in <a href="http://jessicahische.is/sellingyoustuff" title="Jessica Hische - Shop">her store</a>. Jessica has been named a Print Magazine New Visual Artist (20 under 30), one of Forbes 30 under 30 in Art and Design, an ADC Young Gun, a &ldquo;Person to Watch&rdquo; by GD USA, and one of 25 Emerging Artists by STEP Magazine. She&rsquo;s been personally profiled in many magazines including Eye Magazine (UK), Communication Arts, Grafik Magazine (UK), and Novum Magazine (Germany). She is currently serving on the <a href="http://tdc.org" title="The Type Directors Club | Promoting excellence in typography for over 65 years.">Type Directors Club</a> <a href="http://tdc.org/our-board/" title="About: Board of Directors | The Type Directors Club">Board of Directors</a> and divides her time fairly evenly between San Francisco, Brooklyn, and airports en route to design and illustration conferences.</p>^,
  url:       "http://jessicahische.is",
  twitter:   "jessicahische",
  instagram: "jessicahische",
  facebook:  "jessica.hische"
)

@participant4 = @event.participants.create!(
  name:      "Julie Ann Horvath",
  photo:     "http://farmhouse.s3.amazonaws.com/images/speakers/julie-ann-horvath.jpg",
  bio:       %^<p>Julie Ann Horvath is a designer and frontend developer at GitHub. She likes to think of herself as an open source advocate with a big heart for making mockups in markup. She spends a lot of her time speaking at conferences and volunteering to teach (more) women to code.</p>
               <p>She’s also the creator and organizer of Passion Projects, a monthly talk series designed to help surface and celebrate the work of incredible women in the tech industry.</p>^,
  url:       "http://julieannhorvath.com/",
  twitter:   "nrrrdcore",
  instagram: "nrrrdcore"
)

@participant5 = @event.participants.create!(
  name:      "Eleanor Saitta",
  photo:     "http://farmhouse.s3.amazonaws.com/images/speakers/eleanor-saitta.jpg",
  bio:       %^<p><a href="http://dymaxion.org" title="Dymaxion">Eleanor Saitta</a> is a hacker, designer, artist, writer, and barbarian. She makes a living and a vocation of understanding how complex, transdisciplinary systems operate and redesigning them to work, or at least fail, better. Among other things, Eleanor is a co-founder of <a href="http://octotrike.org" title="Trike: Trike">the Trike project</a> and the <a href="http://const.is">Constitutional Analysis Support Team</a>, Technical Director at the <a href="http://immi.is">International Modern Media Institute</a>, Principal Security Engineer at the <a href="http://openitp.org" title="openitp.org">Open Internet Tools Project</a>, a member of the advisory board at <a href="http://gwob.org" title="Geeks Without Bounds">Geeks Without Bounds</a>, a contributor to the <a href="http://briar.sf.net" title="Briar: A Secure News and Discussion System">Briar project</a>, and a Senior Security Associate with <a href="http://stachliu.com" title="Home &laquo; Stach &amp; Liu">Stach &amp; Liu</a>. She is nomadic and lives mostly in airports and occasionally in New York, London, and Stockholm. She can be found at <a href="http://dymaxion.org" title="Dymaxion">http://dymaxion.org</a> and on Twitter as <a href="https://twitter.com/dymaxion">@dymaxion</a>.</p>^,
  url:       "https://dymaxion.org",
  twitter:   "dymaxion"
)

@participant6 = @event.participants.create!(
  name:      "Nirvan Mullick",
  photo:     "http://farmhouse.s3.amazonaws.com/images/speakers/nirvan-mullick.jpg",
  bio:       %^<p><a href="http://twitter.com/nirvan">Nirvan</a> is an LA based filmmaker, creative consultant, speaker, and entrepreneur. <a href="http://nirvan.com">Nirvan</a> began teaching himself animation while studying philosophy at <a href="http://www.ncf.edu/">New College</a>. He went on to earn an MFA in Experimental Animation from <a href="http://www.calarts.com/">CalArts</a>. Nirvan's animated short films have screened in festivals worldwide, winning numerous awards. In 2001, Nirvan began an ongoing collaborative experiment called <a href="http://the1secondfilm.com/">The 1 Second Film</a>, which became among the first crowdfunded films. In 2012, Nirvan directed <a href="http://www.cainesarcade.com">Caine's Arcade</a>, an 11-minute short film that became a viral phenomenon, receiving over 8 million views and sparking a global movement of cardoard creativity in kids around the world. After Caine's Arcade, Nirvan founded the non-profit <a href="http://imagination.is">Imagination Foundation</a> to find, foster, and fund creativity and entrepreneurship in kids. Nirvan has received the Dan Eldon <span>Creative Activist Award and the Innovation in Action award. </span>Nirvan is a partner at <a href="http://facebook.com/interconnected.is">Interconnected</a>, consults with companies and non-profits, serves on the board of <a href="http://www.CicLAvia.org">CicLAvia</a>, and tries to keep up with his garden and email.</p>^,
  url:       "http://www.nirvan.com",
  twitter:   "nirvan"
)

@participant7 = @event.participants.create!(
  name:      "Barefoot Ted",
  photo:     "http://farmhouse.s3.amazonaws.com/images/speakers/barefoot-ted.jpg",
  bio:       %^<p><a href="http://barefootted.com" title="Barefoot Ted's Adventures">Barefoot Ted</a> is an independent athlete committed to re-discovering primal natural human capacities and encouraging others to do the same.</p>
               <p>Having spent the last 10 years focused on mastering barefoot long distance running, BFT now focuses on sharing his insights through speaking engagements, social networking and acting as the Spokesmonkey for <a href="http://www.lunasandals.com">LUNA</a>, the adventure sandal company he founded in Seattle.</p>
               <p>Many have come to know about him through the pages of <a href="http://www.chrismcdougall.com" title="Christopher McDougall | Born to Run | National Bestseller">Christopher McDougall's</a> best-selling book "<a href="http://www.amazon.com/Born-Run-Superathletes-Greatest-Vintage/dp/0307279189" title="Born to Run: A Hidden Tribe, Superathletes, and the Greatest Race the World Has Never Seen: Christopher McDougall: 9780307279187: Amazon.com: Books">Born to Run</a>", a book BFT likes to call his quirky PhD. thesis that he didn't have to write.</p>
               <p>Ted has been featured in numerous articles and frequently interviewed. He enjoys sharing his philosophy of running and life to audiences large and small.</p>
               <p>As "Barefoot Ted", he has played a major role in defining and popularizing the new/old concept of barefoot running and minimalist footwear to a new generation, being an early adopter of the current trend.</p>
               <p>Ted's research and adventures have been regularly shared on his popular blog, <a href="http://barefootted.com">Barefoot Ted's Adventures</a> on his <a href="https://www.facebook.com/barefootted">Facebook Fan Page</a> and on <a href="https://twitter.com/BarefootTed">Twitter</a>. He also hosts an online <a href="http://groups.google.com/group/huaraches?hl=en">forum dedicated to minimalist/barefoot running</a>.</p>
               <p>These days Ted enjoys spreading the news about his favorite sandals and telling stories of his adventures. Projects for 2014 include more Barefoot Ted's Adventures active vacations in Mexico, Turkey and Japan and a LUNA USA TOUR visiting retailers across the country.</p>^,
  url:       "http://www.barefootted.com/",
  twitter:   "BarefootTed",
  instagram: "barefoot_ted",
  facebook:  "barefootted"
)

@participant8 = @event.participants.create!(
  name:      "Willo O'Brien",
  photo:     "http://farmhouse.s3.amazonaws.com/images/speakers/willo-o-brien.jpg",
  bio:       %^<p><a href="http://willolovesyou.com/about/" title="About | Willo O&#039;Brien">Willo O&rsquo;Brien</a> has made a career out of creativity. A prolific artist, tech geek, and <a href="http://willolovesyou.com/work/" title="Work With Me | Willo O&#039;Brien">creative business consultant/coach</a> for over a decade, she knows what works and what doesn&rsquo;t in the ever-changing world of startups and innovative small business.</p>
               <p>After founding several businesses of her own, and serving as co-founder of two successful startups, she now shares her expertise <a href="http://willolovesyou.com/courses/" title="Course Offerings | Willo O&#039;Brien">teaching</a> and coaching other multi-hyphenated professionals (like you) to find that elusive <a href="http://willolovesyou.com/2013/07/the-joy-of-work-whats-your-guiding-compass/" title="The Joy of Work: What's your Guiding Compass? | Willo O&#039;Brien">sweet spot</a>.</p>
               <p>Well versed in the heart-wrenching art of letting go, she&rsquo;s made big, bold leaps in her career, many of which took a fierce dedication to her motto of &ldquo;feel the fear &amp; follow your heart anyway.&rdquo; Willo can be found at <a href="http://willolovesyou.com" title="Willo O&#039;Brien | Inspiring Creative Sustainability in Life &amp; Business">WilloLovesYou.com</a> and <a href="https://twitter.com/WilloLovesYou">@WilloLovesYou</a> on every social platform out there&hellip; say hello!</p>^,
  url:       "http://willolovesyou.com/",
  twitter:   "willolovesyou",
  instagram: "willolovesyou"
)

puts "# creating test participation (event + session + participant + role)"
Participation.create!(session: @session1, participant: @participant1, event: @event, role: @role)
Participation.create!(session: @session2, participant: @participant2, event: @event, role: @role)
Participation.create!(session: @session3, participant: @participant3, event: @event, role: @role)
Participation.create!(session: @session4, participant: @participant4, event: @event, role: @role)
Participation.create!(session: @session5, participant: @participant5, event: @event, role: @role)
Participation.create!(session: @session6, participant: @participant6, event: @event, role: @role)
Participation.create!(session: @session7, participant: @participant7, event: @event, role: @role)
Participation.create!(session: @session8, participant: @participant8, event: @event, role: @role)

puts "# creating test sponsors"
Sponsor.create!(
  name: "GitHub",
  logo: "http://farmhouse.s3.amazonaws.com/images/sponsors/github.png",
  url: "http://github.com/",
  event: @event
)

Sponsor.create!(
  name: "Carbon Five",
  logo: "http://farmhouse.s3.amazonaws.com/images/sponsors/carbon-five.png",
  url: "http://carbonfive.com/",
  event: @event
)

Sponsor.create!(
  name: "Pivotal Labs",
  logo: "http://farmhouse.s3.amazonaws.com/images/sponsors/pivotal-labs.png",
  url: "http://pivotallabs.com/",
  event: @event
)

Sponsor.create!(
  name: "MailChimp",
  logo: "http://farmhouse.s3.amazonaws.com/images/sponsors/mailchimp.png",
  url: "http://mailchimp.com/",
  event: @event
)

Sponsor.create!(
  name: "Thunderbolt Labs",
  logo: "http://farmhouse.s3.amazonaws.com/images/sponsors/thunderbolt-labs.png",
  url: "http://thunderboltlabs.com/",
  event: @event
)

puts "#" * 80
