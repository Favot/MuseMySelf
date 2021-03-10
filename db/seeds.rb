# Demo user : lucas
# Demo topic : music
# Demo journey : music17th

puts "Cleaning all databases..." # Journey Content, Journey, Content, User, Topic

JourneyContent.destroy_all
Journey.destroy_all
Topic.destroy_all
Content.destroy_all
User.destroy_all

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
    name: "Voyage musical dans la France du XXVIIe siècle",
    summary: "Partez à la découverte des lieux, des musiciens et des repertoires de la musique française du XXVIIe siècle.",
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

art_5 = Journey.new(
  name: "Couleurs, bleu, jaune, rouge dans l’art",
  summary: "Découvrez l’art par une thématique originale : comment les 3 couleurs primaires, le bleu, le jaune et le rouge, se sont imposées parmi les peintres ?",
  topic: art
)
art_5.save!


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

architecture_5 = Journey.new(
  name: "Le théâtre et ses illusions de perspective",
  summary: "Découvrez les principes géométriques de base pour concevoir et gérer la réalisation de scènes théâtrales, qui fondent leur expressivité sur les effets de perspective de l'architecture et des espaces illusoires mis en place sur la scène.",
  topic: architecture
)
architecture_5.save!

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

photo_5 = Journey.new(
  name: "Héroïnes de la Modernité",
  summary: "Jeunes filles romantiques et amoureuses, patriotes héroïques, espionnes rusées et impitoyables... Découvrez les portraits des femmes qui ont inspiré les héroïnes des romans des Jules Verne.",
  topic: photo
)
photo_5.save!

################


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


puts "Linking demo journey to content..."
journey_content = JourneyContent.new(
  journey: music17th_journey,
  content: music17th_1,
  position: 1
)
journey_content.save!

journey_content = JourneyContent.new(
  journey: music17th_journey,
  content: music17th_2,
  position: 2
)
journey_content.save!

journey_content = JourneyContent.new(
  journey: music17th_journey,
  content: music17th_3,
  position: 3
)
journey_content.save!

journey_content = JourneyContent.new(
  journey: music17th_journey,
  content: music17th_4,
  position: 4
)
journey_content.save!

journey_content = JourneyContent.new(
  journey: music17th_journey,
  content: music17th_5,
  position: 5
)
journey_content.save!



puts "Finished!"
