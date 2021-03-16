# Demo user : lucas
# Demo journey : music17th

require 'faker'

puts "Cleaning all databases..."

UserJourneyContent.destroy_all
UserJourney.destroy_all
User.destroy_all
JourneyContent.destroy_all
Content.destroy_all
Journey.destroy_all
Topic.destroy_all

puts "DB cleared"

puts "Seeding some data..."
is_cloudinary_active = true

# -- 4 USERS
puts "Creating users..."

lucas = User.new(
  email: "lucas@exemple.com",
  password: "123456",
  name: "lucasdeouf"
  # first_name: "Lucas",
  # last_name: "Martin"
)

# Photo is not implemented on User model yet
# file = File.open(Rails.root.join('db/media/users/lucas.jpg'))
# if is_cloudinary_active
#   lucas.photo.attach(io: file, filename: 'lucas.jpg', content_type: 'images/jpeg')
# end
lucas.save!

john = User.new(
  email: "john@exemple.com",
  password: "123456",
  name: "johndoe"
)
john.save!

marie = User.new(
  email: "marie@exemple.com",
  password: "123456",
  name: "Marie"
)
marie.save!

chris = User.new(
  email: "chris@exemple.com",
  password: "123456",
  name: "Chris"
)
chris.save!

# -- 4 TOPICS
puts "Creating topics..."

music = Topic.new(name: "Musique")
music.save!

art = Topic.new(name: "Art")
art.save!

architecture = Topic.new(name: "Architecture")
architecture.save!

photo = Topic.new(name: "Photographie")
photo.save!

# -- 5 JOURNEYS per Topic (except 7 for music)
puts "Creating journeys..."

# Journeys for music
music17th = Journey.new(
    name: "Voyage musical dans la France du XVIIe siècle",
    summary: "Partez à la découverte des lieux, des musiciens et des repertoires de la musique française du XVIIe siècle.",
    topic: music
)
music17th.save!

music_1 = Journey.new(
  name: 'Opéra du XVIIIe siècle : Haendel & Mozart',
  summary: 'Découvrez l\'opéra baroque et classique à travers le Giulio Cesare de Haendel et le Don Giovanni de Mozart.',
  topic: music
)
music_1.save!

music_2 = Journey.new(
  name: 'Opéra du XIXe siècle : Meyerbeer, Wagner, & Verdi',
  summary: 'Découvrez la musique et l\'impact culturel de trois opéras canoniques des années 1800 : Les Huguenots, Das Rheingold, et Otello.',
  topic: music
)
music_2.save!

 music_3= Journey.new(
  name: "Musique du monde : Rythmes balinais",
  summary: "Une introduction à la musique balinaise, et au rôle de la musique dans la culture balinaise grâce à un parcours interactif axé sur les rythmes de Bali.",
  topic: music
)
music_3.save!

music_4 = Journey.new(
  name: "Introduction à l'opéra italien",
  summary: "Explorez l'opéra italien dans cette expérience d'apprentissage en deux actes et apprenez à écouter la musique d'une nouvelle manière.
",
  topic: music
)
music_4.save!

music_5 = Journey.new(
  name: "Le jazz : la musique, les histoires, les acteurs",
  summary: "Apprenez ce qui est unique dans le jazz (swing, improvisation, structure et expression) et obtenez le point de vue d'initiés de célèbres musiciens de jazz.",
  topic: music
)
music_5.save!

music_6 = Journey.new(
  name: "La musique européenne à l'époque romantique",
  summary: "Une véritable découverte de la culture musicale romantique occidentale depuis le XIXe siècle.",
  topic: music
)
music_6.save!


# Journeys for art
art_1 = Journey.new(
  name: "Une brève histoire de l’art",
  summary: "De la Renaissance au XXe siècle, découvrez les grandes tendances et mouvements de l’histoire de l’art grâce à des contenus intéractifs.",
  topic: art
)
art_1.save!

art_2 = Journey.new(
  name: "Connaissez-vous le 9e Art ?",
  summary: "Ce parcours permet de découvrir l’histoire de la bande-dessinée, ses différents genres, ces pionniers et ses stars. Vous pourrez également comprendre les liens étroits qui unissent la BD aux autres arts.",
  topic: art
)
art_2.save!

art_3 = Journey.new(
  name: "Louis XIV à Versailles",
  summary: "Fonctionnement du pouvoir, aménagement des jardins, organisation des divertissements et des plaisirs, goût pour l’art… Plongez dans tous les secrets et toute l’organisation de Versailles sous le règne de Louis XIV.",
  topic: art
)
art_3.save!

art_4 = Journey.new(
  name: "Le Pop Art",
  summary: "Suivez ce parcours si vous souhaitez tout savoir sur cet incontournable courant artistique, né à la fin des années 1950 en Angleterre.",
  topic: art
)
art_4.save!


# Journeys for architecture
architecture_1 = Journey.new(
  name: "Histoire de l'architecture chinoise",
  summary: "Ce parcours explore l'histoire architecturale riche et variée de la Chine.",
  topic: architecture
)
architecture_1.save!

architecture_2 = Journey.new(
  name: "Rome : ville de la Renaissance et du Baroque",
  summary: "Découvrez comment l'art, l'architecture et la forme urbaine de la Rome de la Renaissance et du Baroque ont projeté l'image de la ville à ses citoyens et au monde entier.",
  topic: architecture
)
architecture_2.save!

architecture_3 = Journey.new(
  name: "Architecture moderne japonaise",
  summary: "Explorez les éléments clés de l'architecture moderne japonaise et l'histoire qui s'y rapporte, en mettant l'accent sur son occidentalisation, couvrant la période de 1868 à 1945.",
  topic: architecture
)
architecture_3.save!

architecture_4 = Journey.new(
  name: "Une histoire mondiale de l'architecture",
  summary: "Découvrez la riche histoire de l'architecture de l'humanité au cours de ce voyage autour du globe, de 100 000 avant notre ère à environ 1 600 de notre ère.",
  topic: architecture
)
architecture_4.save!

# Journeys for photo
photo_1 = Journey.new(
  name: "Une brève histoire de la photographie",
  summary: "Amateur de photographie ancienne ou instagrammeur frénétique, ce parcours s’adresse à tous ceux qui s’intéressent à la photographie, à son histoire, à ses techniques et à ses grands noms.",
  topic: photo
)
photo_1.save!

photo_2 = Journey.new(
  name: "L'héroïsme de la Première Guerre mondiale à travers la photographie",
  summary: "Découvrez quelques-unes des façons dont l'héroïsme et la Première Guerre mondiale sont dépeints dans l'art, la photographie et le cinéma.",
  topic: photo
)
photo_2.save!

photo_3 = Journey.new(
  name: "Andy Warhol: Instantanés",
  summary: "Ce parcours présente l'importance de la photographie dans l'oeuvre d'Andy Warhol et met en lumière différents thèmes et techniques explorés par l'artiste durant toute sa carrière.",
  topic: photo
)
photo_3.save!

photo_4 = Journey.new(
  name: "Photographie par Yasuo Kiyonaga",
  summary: "Découvrez le point de vue exceptionnel et l'imagination passionnée de cet artiste japonais.",
  topic: photo
)
photo_4.save!

# last 3 journeys
architecture_5 = Journey.new(
  name: "Le théâtre et ses illusions de perspective",
  summary: "Découvrez les principes géométriques de base pour concevoir et gérer la réalisation de scènes théâtrales, qui fondent leur expressivité sur les effets de perspective de l'architecture et des espaces illusoires mis en place sur la scène.",
  topic: architecture
)
architecture_5.save!

photo_5 = Journey.new(
  name: "Héroïnes de la Modernité",
  summary: "Jeunes filles romantiques et amoureuses, patriotes héroïques, espionnes rusées et impitoyables... Découvrez les portraits des femmes qui ont inspiré les héroïnes des romans des Jules Verne.",
  topic: photo
)
photo_5.save!

art_5 = Journey.new(
  name: "Couleurs, bleu, jaune, rouge dans l’art",
  summary: "Découvrez l’art par une thématique originale : comment les 3 couleurs primaires, le bleu, le jaune et le rouge, se sont imposées parmi les peintres ?",
  topic: art
)
art_5.save!

# -- 5 CONTENTS for Journey 'music17th'
puts "Creating demo contents..."

music17th_1 = Content.new(
  title: "Le Malade Imaginaire",
  author: "Molière",
  date: 1973, # "10/02/1973"
  category: "Théâtre",
  duration: 120,
  url: "https://www.fnac.com/SearchResult/ResultList.aspx?SCat=0%211&Search=le+malade+imaginaire&sft=1&sa=0",
  description: "Le Malade imaginaire, dernière œuvre dramatique écrite par Molière, \
                est une comédie-ballet en trois actes et en prose, créée le 10 février 1673 \
                par la Troupe du Roi sur la scène du Palais-Royal à Paris, avec une musique de scène \
                composée par Marc-Antoine Charpentier."
)

file = File.open(Rails.root.join('db/media/contents/music17th_1.jpg'))
if is_cloudinary_active
  music17th_1.photo.attach(io: file, filename: 'music17th_1.jpg', content_type: 'image/jpeg')
end
music17th_1.save!

music17th_2 = Content.new(
  title: "Le Malade Imaginaire - accompagnement musical",
  author: "Marc-Antoine Charpentier",
  date: 1973, # "10/02/1973"
  category: "Audio",
  duration: 90,
  url: "https://open.spotify.com/album/2sO5ltxLauCkAMK5fCckFY?si=hYlqJ4gYRKeaugclJn7wJA",
  description: "La musique d'accompagnement de l'oeuvre éponyme de Molière est un \
                chef-d'oeuvre de la musique non religieuse du XVIIe."
)

file = File.open(Rails.root.join('db/media/contents/music17th_2.jpg'))
if is_cloudinary_active
  music17th_2.photo.attach(io: file, filename: 'music17th_2.jpg', content_type: 'image/jpeg')
end
music17th_2.save!

music17th_3 = Content.new(
  title: "Tous les matins du monde",
  author: "Alain Corneau",
  date: 1991, # "18/12/1991"
  category: "Film",
  duration: 115,
  url: "https://www.senscritique.com/film/Tous_les_matins_du_monde/472390",
  description: "A la fin de sa vie, Marin Marais, prestigieux violiste de Louis XIV, \
                se souvient de son apprentissage avec Monsieur de Sainte Colombe, \
                grand maître de la viole de gambe. Suite au décès de sa femme, le virtuose \
                a recherché en vain une perfection absolue dans son art, possède son apprenti."
)

file = File.open(Rails.root.join('db/media/contents/music17th_3.jpg'))
if is_cloudinary_active
  music17th_3.photo.attach(io: file, filename: 'music17th_3.jpg', content_type: 'image/jpeg')
end
music17th_3.save!

music17th_4 = Content.new(
  title: "L'Ouïe",
  author: "Abraham Bosse",
  date: 1638,
  category: "Peinture",
  duration: 115,
  url: "http://expositions.bnf.fr/bosse/grand/163.htm",
  description: "Cette oeuvre extraite de la série 'Cinq Sens' de Bosse illustre de la façon\
                la plus typique la production musicale la plus fréquente au XVIIe. En effet, \
                contrairement aux idées reçues, la musique était surtout pratiquée en petits comités \
                en musique de salon. Cependant, le caractère religieux est indéniable. Ici deux \
                musiciens, une jeune femme au luth et un homme à la viole de gambe, accompagnent \
                les chants religieux de leurs compagnons."
)

file = File.open(Rails.root.join('db/media/contents/music17th_4.jpg'))
if is_cloudinary_active
  music17th_4.photo.attach(io: file, filename: 'music17th_4.jpg', content_type: 'image/jpeg')
end
music17th_4.save!

music17th_5 = Content.new(
  title: "Leçons de ténèbres",
  author: "François Couperin",
  date: 1638,
  category: "Audio",
  duration: 115,
  url: "https://open.spotify.com/album/0S1CTBRIJeF9NOYFYN6UpM?si=QTcE5fmwSLCEkYP5v-87-Q",
  description: "Cette oeuvre extraite de la série 'Cinq Sens' de Bosse illustre de la façon\
                la plus typique la production musicale la plus fréquente au XVIIe. En effet, \
                contrairement aux idées reçues, la musique était surtout pratiquée en petits comités \
                en musique de salon. Cependant, le caractère religieux est indéniable. Ici deux \
                musiciens, une jeune femme au luth et un homme à la viole de gambe, accompagnent \
                les chants religieux de leurs compagnons."
)

file = File.open(Rails.root.join('db/media/contents/music17th_5.jpg'))
if is_cloudinary_active
  music17th_5.photo.attach(io: file, filename: 'music17th_5.jpg', content_type: 'image/jpeg')
end
music17th_5.save!

music17th_6 = Content.new(
  title: "La Musique en France à l'époque baroque",
  author: "James R. Anthony",
  date: 1981,
  category: "Livre",
  duration: 180,
  url: "https://livre.fnac.com/a2747744/James-R-Anthony-La-Musique-en-France-a-l-epoque-baroque#int=S:Suggestion|FA:LIV|1|2747744|BL5|L1",
  description: "Depuis une vingtaine d'années, la musique baroque a fait l'objet d'un débat aussi\
                passionné que passionnant. Toutefois, aucun ouvrage d'ensemble n'avait été consacré \
                à cette époque particulièrement florissante en France puisqu'elle vit naître la tragédie \
                lyrique et se développer le ballet, la musique religieuse prendre une grande importance \
                dans la vie de cour, la sonate et le concerto italiens envahir les salons, tandis que le \
                clavecin supplantait le luth."
)

file = File.open(Rails.root.join('db/media/contents/music17th_6.jpg'))
if is_cloudinary_active
  music17th_6.photo.attach(io: file, filename: 'music17th_6.jpg', content_type: 'image/jpg')
end
music17th_6.save!

# -- linking demo content to journey
puts "Linking demo content to demo journey..."

journey_content = JourneyContent.new(
  journey: music17th,
  content: music17th_1,
  position: 1
)
journey_content.save!

journey_content = JourneyContent.new(
  journey: music17th,
  content: music17th_2,
  position: 2
)
journey_content.save!

journey_content = JourneyContent.new(
  journey: music17th,
  content: music17th_3,
  position: 3
)
journey_content.save!

journey_content = JourneyContent.new(
  journey: music17th,
  content: music17th_4,
  position: 4
)
journey_content.save!

journey_content = JourneyContent.new(
  journey: music17th,
  content: music17th_5,
  position: 5
)
journey_content.save!

journey_content = JourneyContent.new(
  journey: music17th,
  content: music17th_6,
  position: 6
)
journey_content.save!

# -- user_journeys
puts "Faking users registered to journeys"

user_journey_1 = UserJourney.new(
  journey: music17th,
  user: lucas,
  completed: false
)
user_journey_1.save!

user_journey_2 = UserJourney.new(
  journey: music17th,
  user: marie,
  completed: false
)
user_journey_2.save!

user_journey_3 = UserJourney.new(
  journey: music_4,
  user: lucas,
  completed: true
)
user_journey_3.save!

user_journey_4 = UserJourney.new(
  journey: music17th,
  user: chris,
  completed: true
)
user_journey_4.save!

# -- user_journey_contents
puts "Faking user rating contents of demo journey"

user_journey_content_1 = UserJourneyContent.new(
  rating: 5,
  review: "Une de mes pièces de théâtre préférées !",
  user_journey: user_journey_2,
  content: music17th_1,
  completed: true,
  position: 1
)
user_journey_content_1.save!

user_journey_content_2 = UserJourneyContent.new(
  rating: 3,
  review: "J'adore la pièce de théatre 'Le Malade Imaginaire', mais je n'aime pas trop la musique qui l'accompagne...",
  user_journey: user_journey_2,
  content: music17th_2,
  completed: true,
  position: 2
)
user_journey_content_2.save!

# user journey with all content
user_journey_content_3 = UserJourneyContent.new(
  rating: 4,
  review: "Magnifique pièce de théatre. Surtout en période de covid",
  user_journey: user_journey_4,
  content: music17th_1,
  completed: true,
  position: 1
)
user_journey_content_3.save!

user_journey_content_4 = UserJourneyContent.new(
  rating: 2,
  review: "La musique ne colle pas à la pièce et le ton de Molière",
  user_journey: user_journey_4,
  content: music17th_2,
  completed: true,
  position: 2
)
user_journey_content_4.save!

user_journey_content_5 = UserJourneyContent.new(
  rating: 3,
  review: "Très belle réalisation de Alain Corneau",
  user_journey: user_journey_4,
  content: music17th_3,
  completed: true,
  position: 3
)
user_journey_content_5.save!

user_journey_content_6 = UserJourneyContent.new(
  rating: 4,
  review: "Etonnant de réalisme",
  user_journey: user_journey_4,
  content: music17th_4,
  completed: true,
  position: 4
)
user_journey_content_6.save!

user_journey_content_7 = UserJourneyContent.new(
  rating: 5,
  review: "le meilleur contenu de ce parcours",
  user_journey: user_journey_4,
  content: music17th_5,
  completed: true,
  position: 5
)
user_journey_content_7.save!

user_journey_content_8 = UserJourneyContent.new(
  rating: 2,
  review: "Je n'apprécie pas le baroque",
  user_journey: user_journey_4,
  content: music17th_6,
  completed: true,
  position: 6
)
user_journey_content_8.save!

puts "Finished!"


# Start creating fake user at large scale


# p "create 20 users"


# 20.times do |_index|
#   User.create!(name: Faker::Name.name,
#               email: Faker::Internet.email,
#               password: "123456"
#                  )
# end


# #  get all users

# users = User.all

# # get all journeys

# journeys = Journey.all
# journeys_number = Journey.count
# # each user create a random numbers of journeys


# users.each do |user|
#   # each user pick up a random number between one to the max number of journey
#   random_numbers_of_journey = rand(1..journeys_number)
#   # p random_numbers_of_journey
#   journeys_pickup = journeys.sample(random_numbers_of_journey)

#   journeys_pickup.each do | journey_pickup|

#     user_journey_created = UserJourney.create!(
#       journey: journey_pickup,
#       user: user,
#       completed: false
#     )
      # reset here tomorrow nigth
#     p journey_pickup.contents
#   end

# end

# user_journey_1 = UserJourney.new(
#   journey: music17th,
#   user: lucas,
#   completed: false
# )
