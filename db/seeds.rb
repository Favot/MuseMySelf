# require 'faker'

puts "Cleaning all databases..."

UserAnswer.destroy_all
Answer.destroy_all
QuizQuestion.destroy_all
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



# -- USERS
puts "Creating 4 users"

lucas = User.create!(
  email: "lucas@example.com",
  password: "123456",
  name: "lucasdeouf"
)

john = User.create!(
  email: "john@example.com",
  password: "123456",
  name: "johndoe"
)

marie = User.create!(
  email: "marie@example.com",
  password: "123456",
  name: "Marie"
)

chris = User.create!(
  email: "chris@example.com",
  password: "123456",
  name: "Chris"
)



# -- TOPICS
puts "Creating 4 topics"

music = Topic.create!(name: "Musique")
art = Topic.create!(name: "Art")
architecture = Topic.create!(name: "Architecture")
photo = Topic.create!(name: "Photographie")



# -- JOURNEYS without content for MUSIC
puts "Creating journeys without contents for topic music"

music_1 = Journey.create!(
  name: 'Opéra du XVIIIe siècle : Haendel & Mozart',
  summary: 'Découvrez l\'opéra baroque et classique à travers le Giulio Cesare de Haendel et le Don Giovanni de Mozart.',
  topic: music
)

music_2 = Journey.create!(
  name: 'Opéra du XIXe siècle : Meyerbeer, Wagner, & Verdi',
  summary: 'Découvrez la musique et l\'impact culturel de trois opéras canoniques des années 1800 : Les Huguenots, Das Rheingold, et Otello.',
  topic: music
)

music_3 = Journey.create!(
  name: "Musique du monde : Rythmes balinais",
  summary: "Une introduction à la musique balinaise, et au rôle de la musique dans la culture balinaise grâce à un parcours interactif axé sur les rythmes de Bali.",
  topic: music
)

music_4 = Journey.create!(
  name: "Introduction à l'opéra italien",
  summary: "Explorez l'opéra italien dans cette expérience d'apprentissage en deux actes et apprenez à écouter la musique d'une nouvelle manière.",
  topic: music
)

music_5 = Journey.create!(
  name: "Le jazz : la musique, les histoires, les acteurs",
  summary: "Apprenez ce qui est unique dans le jazz (swing, improvisation, structure et expression) et obtenez le point de vue d'initiés de célèbres musiciens de jazz.",
  topic: music
)

music_6 = Journey.create!(
  name: "La musique européenne à l'époque romantique",
  summary: "Une véritable découverte de la culture musicale romantique occidentale depuis le XIXe siècle.",
  topic: music
)

# -- Journey with content for demo
music17th = Journey.create!(
  name: "Voyage musical dans la France du XVIIe siècle",
  summary: "Partez à la découverte des lieux, des musiciens et des repertoires de la musique française du XVIIe siècle.",
  topic: music
)



# -- JOURNEYS without content for ART
puts "Creating journeys without contents for topic art"

art_1 = Journey.create!(
  name: "Une brève histoire de l’art",
  summary: "De la Renaissance au XXe siècle, découvrez les grandes tendances et mouvements de l’histoire de l’art grâce à des contenus intéractifs.",
  topic: art
)

art_2 = Journey.create!(
  name: "Connaissez-vous le 9e Art ?",
  summary: "Ce parcours permet de découvrir l’histoire de la bande-dessinée, ses différents genres, ces pionniers et ses stars. Vous pourrez également comprendre les liens étroits qui unissent la BD aux autres arts.",
  topic: art
)

art_3 = Journey.create!(
  name: "Louis XIV à Versailles",
  summary: "Fonctionnement du pouvoir, aménagement des jardins, organisation des divertissements et des plaisirs, goût pour l’art… Plongez dans tous les secrets et toute l’organisation de Versailles sous le règne de Louis XIV.",
  topic: art
)

art_4 = Journey.create!(
  name: "Le Pop Art",
  summary: "Suivez ce parcours si vous souhaitez tout savoir sur cet incontournable courant artistique, né à la fin des années 1950 en Angleterre.",
  topic: art
)



# -- JOURNEYS without content for ARCHITECTURE
puts "Creating journeys without contents for topic architecture"

architecture_1 = Journey.create!(
  name: "Histoire de l'architecture chinoise",
  summary: "Ce parcours explore l'histoire architecturale riche et variée de la Chine.",
  topic: architecture
)

architecture_2 = Journey.create!(
  name: "Rome : ville de la Renaissance et du Baroque",
  summary: "Découvrez comment l'art, l'architecture et la forme urbaine de la Rome de la Renaissance et du Baroque ont projeté l'image de la ville à ses citoyens et au monde entier.",
  topic: architecture
)

architecture_3 = Journey.create!(
  name: "Architecture moderne japonaise",
  summary: "Explorez les éléments clés de l'architecture moderne japonaise et l'histoire qui s'y rapporte, en mettant l'accent sur son occidentalisation, couvrant la période de 1868 à 1945.",
  topic: architecture
)

architecture_4 = Journey.create!(
  name: "Une histoire mondiale de l'architecture",
  summary: "Découvrez la riche histoire de l'architecture de l'humanité au cours de ce voyage autour du globe, de 100 000 avant notre ère à environ 1 600 de notre ère.",
  topic: architecture
)



# -- JOURNEYS without content for PHOTO
puts "Creating journeys without contents for topic photo"

photo_1 = Journey.create!(
  name: "Une brève histoire de la photographie",
  summary: "Amateur de photographie ancienne ou instagrammeur frénétique, ce parcours s’adresse à tous ceux qui s’intéressent à la photographie, à son histoire, à ses techniques et à ses grands noms.",
  topic: photo
)

photo_2 = Journey.create!(
  name: "L'héroïsme de la Première Guerre mondiale à travers la photographie",
  summary: "Découvrez quelques-unes des façons dont l'héroïsme et la Première Guerre mondiale sont dépeints dans l'art, la photographie et le cinéma.",
  topic: photo
)

photo_3 = Journey.create!(
  name: "Andy Warhol: Instantanés",
  summary: "Ce parcours présente l'importance de la photographie dans l'oeuvre d'Andy Warhol et met en lumière différents thèmes et techniques explorés par l'artiste durant toute sa carrière.",
  topic: photo
)

photo_4 = Journey.create!(
  name: "Photographie par Yasuo Kiyonaga",
  summary: "Découvrez le point de vue exceptionnel et l'imagination passionnée de cet artiste japonais.",
  topic: photo
)



# -- Last 3 journeys created
architecture_5 = Journey.create!(
  name: "Le théâtre et ses illusions de perspective",
  summary: "Découvrez les principes géométriques de base pour concevoir et gérer la réalisation de scènes théâtrales, qui fondent leur expressivité sur les effets de perspective de l'architecture et des espaces illusoires mis en place sur la scène.",
  topic: architecture
)

photo_5 = Journey.create!(
  name: "Héroïnes de la Modernité",
  summary: "Jeunes filles romantiques et amoureuses, patriotes héroïques, espionnes rusées et impitoyables... Découvrez les portraits des femmes qui ont inspiré les héroïnes des romans des Jules Verne.",
  topic: photo
)

art_5 = Journey.create!(
  name: "Couleurs, bleu, jaune, rouge dans l’art",
  summary: "Découvrez l’art par une thématique originale : comment les 3 couleurs primaires, le bleu, le jaune et le rouge, se sont imposées parmi les peintres ?",
  topic: art
)



# -- CONTENTS + JOURNEY_CONTENTS for demo journey 'music17th'
puts "Creating 6 contents and linking them to a journey"

# content 1
music17th_1 = Content.new(
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

file = File.open(Rails.root.join('db/media/contents/music17th_1.jpg'))
if is_cloudinary_active
  music17th_1.photo.attach(io: file, filename: 'music17th_1.jpg', content_type: 'image/jpg')
end
music17th_1.save!

# journey content 1
journey_content_1 = JourneyContent.create!(
  journey: music17th,
  content: music17th_1,
  position: 1
)

# content 2
music17th_2 = Content.new(
  title: "Le Malade Imaginaire - accompagnement musical",
  author: "Marc-Antoine Charpentier",
  date: 1973,
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

# journey content 2
journey_content_2 = JourneyContent.create!(
  journey: music17th,
  content: music17th_2,
  position: 2
)

# question jc2 + answers
question_test = QuizQuestion.create!(
  label: "Quel genre mêle théâtre, musique et danse ?",
  journey_content: journey_content_2
)

Answer.create!(content: "Drame", correct: false, quiz_question: question_test)
Answer.create!(content: "Opéra-ballet", correct: false, quiz_question: question_test)
Answer.create!(content: "Comédie-ballet", correct: true, quiz_question: question_test)

# content 3
music17th_3 = Content.new(
  title: "Tous les matins du monde",
  author: "Alain Corneau",
  date: 1991,
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

# journey content 3
journey_content_3 = JourneyContent.create!(
  journey: music17th,
  content: music17th_3,
  position: 3
)

# content 4
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

# journey content 4
journey_content_4 = JourneyContent.create!(
  journey: music17th,
  content: music17th_4,
  position: 4
)

# content 5
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

# journey content 5
journey_content_5 = JourneyContent.create!(
  journey: music17th,
  content: music17th_5,
  position: 5
)

# content 6
music17th_6 = Content.new(
  title: "Le Malade Imaginaire",
  author: "Molière",
  date: 1673,
  category: "Théâtre",
  duration: 120,
  url: "https://www.fnac.com/SearchResult/ResultList.aspx?SCat=0%211&Search=le+malade+imaginaire&sft=1&sa=0",
  description: "Le Malade imaginaire, dernière œuvre dramatique écrite par Molière, \
                est une comédie-ballet en trois actes et en prose, créée le 10 février 1673 \
                par la Troupe du Roi sur la scène du Palais-Royal à Paris, avec une musique de scène \
                composée par Marc-Antoine Charpentier."
)

file = File.open(Rails.root.join('db/media/contents/music17th_6.jpg'))
if is_cloudinary_active
  music17th_6.photo.attach(io: file, filename: 'music17th_6.jpg', content_type: 'image/jpeg')
end
music17th_6.save!

# journey content 6
journey_content_6 = JourneyContent.create!(
  journey: music17th,
  content: music17th_6,
  position: 6
)



# -- QUIZ for the last content of demo journey 'music17th'
puts  "Creating 3 questions (with 3 answers possible for each) for one content"

# question 1 jc 6 + answers
question_1 = QuizQuestion.create!(
  label: "Qui a composé la musique de scène de la pièce ?",
  journey_content: journey_content_6
)

Answer.create!(content: "Lully", correct: false, quiz_question: question_1)
Answer.create!(content: "Charpentier", correct: true, quiz_question: question_1)
Answer.create!(content: "Corelli", correct: false, quiz_question: question_1)

# question 2 jc 6 + answers
question_2 = QuizQuestion.create!(
  label: "Comment se nomme la fille d'Argan ?",
  journey_content: journey_content_6
)

Answer.create!(content: "Angélique", correct: true, quiz_question: question_2)
Answer.create!(content: "Toinette", correct: false, quiz_question: question_2)
Answer.create!(content: "Béline", correct: false, quiz_question: question_2)

# question 3 jc 6 + answers
question_3 = QuizQuestion.create!(
  label: "Quand la pièce a-t-elle été écrite ?",
  journey_content: journey_content_6
)

Answer.create!(content: "1573", correct: false, quiz_question: question_3)
Answer.create!(content: "1673", correct: true, quiz_question: question_3)
Answer.create!(content: "1773", correct: false, quiz_question: question_3)



# -- CONTENTS + JOURNEY_CONTENTS for Journey 'music_5' #jazz
puts "Creating 5 contents and linking them to another journey"

# content 1
jazz_1 = Content.new(
  title: "New Orleans Memories",
  author: "Jelly Roll Morton",
  date: 1940,
  category: "Audio",
  duration: 45,
  url: "https://www.discogs.com/Jelly-Roll-Morton-New-Orleans-Memories/master/880279",
  description: "Sur ses cartes de visite, on pouvait lire « Inventor of Jazz » (« inventeur du jazz »),  \
                « Originator of Stomp and Swing » (« créateur du stomp et du swing »), \
                « World's Greatest Hot Tune Writer » (« le plus grand auteur de morceaux hot au monde ») et, \
                plus de 60 ans après sa mort, bon nombre de critiques pensent désormais qu'il n'avait peut-être pas tort. \
                Découvrez au travers cet album Jelly Roll Morton l'inventeur du jazz, ainsi que la Nouvelle-Orleans berceau \
                et ville emblématique du jazz au travers son histoire."
)

file = File.open(Rails.root.join('db/media/contents/jazz_1.jpg'))
if is_cloudinary_active
  jazz_1.photo.attach(io: file, filename: 'jazz_1.jpg', content_type: 'image/jpeg')
end
jazz_1.save!

# journey content
JourneyContent.create!(
  journey: music_5,
  content: jazz_1,
  position: 1
)

<<<<<<< HEAD
user_journey_content_2 = UserJourneyContent.new(
  rating: 3,
  review: "J'adore la pièce de théatre 'Le Malade Imaginaire', mais je n'aime pas trop la musique qui l'accompagne...",
  user_journey: user_journey_4,
  content: music17th_2,
  completed: false,
=======
# content 2
jazz_2 = Content.new(
  title: "Nightlife",
  author: "Archibald Motley",
  date: 1943,
  category: "Peinture",
  duration: 5,
  url: "https://www.artic.edu/artworks/117266/nightlife",
  description: "Le peintre de Chicago Archibald Motley a représenté le dynamisme de la culture afro-américaine,\
              dépeignant fréquemment de jeunes citadins sophistiqués en ville. La vie nocturne dépeint un cabaret bondé \
              dans le quartier South Side de Bronzeville, avec des gens assis autour de tables et au bar. L’horloge indique une heure et\
              l’endroit est toujours bondé de buveurs et de danseurs. Deux barmans servent les clients et réapprovisionnent l'étalage \
              bien éclairé de l'alcool, et les couples dansent furieusement en arrière-plan sur la musique fournie par le juke-box à droite. \
              La tête étrange au sommet du juke-box est peut-être un distributeur d’arachides connu sous le nom de «Smilin’ Sam d’Alabam ’»; \
              lorsqu'une pièce de monnaie était insérée dans la tête et que la langue était tirée, la machine distribuait des arachides. \
              Motley a unifié la composition grâce à son utilisation de formes répétées et d'un ton bordeaux omniprésent qui baigne toute la \
              scène dans une lumière intense et artificielle. (L'artiste avait vu les Nighthawks d'Edward Hopper à l'Art Institute l'année précédente \
              et était intrigué par son utilisation de la lumière artificielle.) Les figures stylisées sont étroitement interconnectées; \
              ils sont disposés le long d'une diagonale pointue qui comprime l'espace dans un décor en forme de scène. La composition dynamique\
              et les couleurs rehaussées expriment de manière vivante la vivacité de la scène, faisant de Nightlife l’une des peintures les plus \
              élèbres de Motley."
)

file = File.open(Rails.root.join('db/media/contents/jazz_2.jpg'))
if is_cloudinary_active
  jazz_2.photo.attach(io: file, filename: 'jazz_2.jpg', content_type: 'image/jpeg')
end
jazz_2.save!

# journey content
JourneyContent.create!(
  journey: music_5,
  content: jazz_2,
>>>>>>> master
  position: 2
)

# content 3
jazz_3 = Content.new(
  title: "Bird",
  author: "Clint Eastwood",
  date: 1988,
  category: "Film",
  duration: 160,
  url: "https://www.youtube.com/watch?v=8AxcmE5N068",
  description: "Bird est un film américain réalisé par Clint Eastwood et sorti en 1988. \
                Il s'agit d'un film biographique et une interprétation cinématographique de la vie de Charlie Parker,\
                alias « Bird » (Yardbird en VO), jazzman visionnaire et musicien accompli qui éleva le saxophone à un niveau d'expression inédit.\
                Le film, présenté au festival de Cannes 1988, dépeint alternativement la jeunesse et la maturité de cet homme\
                et de ce créateur de génie, sa carrière et ses drames personnels. "
)

file = File.open(Rails.root.join('db/media/contents/jazz_3.jpg'))
if is_cloudinary_active
  jazz_3.photo.attach(io: file, filename: 'jazz_3.jpg', content_type: 'image/jpeg')
end
jazz_3.save!

# journey content
JourneyContent.create!(
  journey: music_5,
  content: jazz_3,
  position: 3
)

# content 4
jazz_4 = Content.new(
  title: "What a Wonderful World",
  author: "Louis Armstrong",
  date: 1638,
  category: "Audio",
  duration: 3,
  url: "http://todo.com",
  description: "Bientôt disponible !"
)

file = File.open(Rails.root.join('db/media/contents/jazz_4.jpg'))
if is_cloudinary_active
  jazz_4.photo.attach(io: file, filename: 'jazz_4.jpg', content_type: 'image/jpeg')
end
jazz_4.save!

# journey content
JourneyContent.create!(
  journey: music_5,
  content: jazz_4,
  position: 4
)

# content 5
jazz_5 = Content.new(
  title: "The Best of Simple",
  author: "Langston Hughes",
  date: 1961,
  category: "Livre",
  duration: 560,
  url: "https://archive.org/details/bestofsimple00lang/page/n7/mode/2up",
  description: "Bientôt disponible !"
)

file = File.open(Rails.root.join('db/media/contents/jazz_5.jpg'))
if is_cloudinary_active
  jazz_5.photo.attach(io: file, filename: 'jazz_5.jpg', content_type: 'image/jpeg')
end
jazz_5.save!

# journey content
JourneyContent.create!(
  journey: music_5,
  content: jazz_5,
  position: 5
)

# content 6
jazz_6 = Content.new(
  title: "La La Land",
  author: "Damien Chazelle",
  date: 2016,
  category: "Film",
  duration: 120,
  url: "http://todo.com",
  description: "Bientôt disponible !"
)

file = File.open(Rails.root.join('db/media/contents/jazz_6.jpg'))
if is_cloudinary_active
  jazz_6.photo.attach(io: file, filename: 'jazz_6.jpg', content_type: 'image/jpg')
end
jazz_6.save!

# journey content
JourneyContent.create!(
  journey: music_5,
  content: jazz_6,
  position: 6
)

# content 7
jazz_7 = Content.new(
  title: "L'odyssée du jazz",
  author: "Noël Balen",
  date: 1993,
  category: "Livre",
  duration: 240,
  url: "http://todo.com",
  description: "Bientôt disponible !"
)

file = File.open(Rails.root.join('db/media/contents/jazz_7.jpg'))
if is_cloudinary_active
  jazz_7.photo.attach(io: file, filename: 'jazz_7.jpg', content_type: 'image/jpg')
end
jazz_7.save!

# journey content
JourneyContent.create!(
  journey: music_5,
  content: jazz_7,
  position: 7
)

# content 8
jazz_8 = Content.new(
  title: "Le jazz et l'art figuratif",
  author: "Keith Mallett",
  date: 1948,
  category: "Peinture",
  duration: 10,
  url: "http://todo.com",
  description: "Bientôt disponible !"
)

file = File.open(Rails.root.join('db/media/contents/jazz_8.jpg'))
if is_cloudinary_active
  jazz_8.photo.attach(io: file, filename: 'jazz_8.jpg', content_type: 'image/jpg')
end
jazz_8.save!

# journey content
JourneyContent.create!(
  journey: music_5,
  content: jazz_8,
  position: 8
)


# -- USER_JOURNEYS + USER_JOURNEY_CONTENTS
puts "Faking users registered to journeys and some & rating reviews on contents"

# -- lucas
puts "Faking data for user lucas"

# one user_journey
user_journey_lucas_1 = UserJourney.create!(
  journey: music17th,
  user: lucas,
  completed: false
)

# one user_journey
user_journey_lucas_2 = UserJourney.create!(
  journey: music_4,
  user: lucas,
  completed: true
)

# -- marie
puts "Faking data for user marie"

# one user_journey + user_journey_contents
user_journey_marie_1 = UserJourney.create!(
  journey: music17th,
  user: marie,
  completed: false
)

UserJourneyContent.create!(
  rating: 3,
  review: "Je n'aime pas trop cette musique...",
  user_journey: user_journey_marie_1,
  content: music17th_2,
  completed: true,
  position: 2
)

UserJourneyContent.create!(
  rating: 5,
  review: "J'adore cette pièce !",
  user_journey: user_journey_marie_1,
  content: music17th_6,
  completed: true,
  position: 6
)

# -- chris
puts "Faking data for user chris"

# one user_journey + user_journey_contents
user_journey_chris_1 = UserJourney.create!(
  journey: music17th,
  user: chris,
  completed: true
)

UserJourneyContent.create!(
  rating: 4,
  review: "Je n'apprécie pas le baroque",
  user_journey: user_journey_chris_1,
  content: music17th_1,
  completed: true,
  position: 1
)

UserJourneyContent.create!(
  rating: 3,
  review: "J'adore la pièce de théatre 'Le Malade Imaginaire', mais je n'aime pas trop la musique qui l'accompagne...",
  user_journey: user_journey_chris_1,
  content: music17th_2,
  completed: true,
  position: 2
)

UserJourneyContent.create!(
  rating: 5,
  review: "Très belle réalisation de Alain Corneau",
  user_journey: user_journey_chris_1,
  content: music17th_3,
  completed: true,
  position: 3
)

UserJourneyContent.create!(
  rating: 4,
  review: "Etonnant de réalisme",
  user_journey: user_journey_chris_1,
  content: music17th_4,
  completed: true,
  position: 4
)

UserJourneyContent.create!(
  rating: 5,
  review: "le meilleur contenu de ce parcours",
  user_journey: user_journey_chris_1,
  content: music17th_5,
  completed: true,
  position: 5
)

UserJourneyContent.create!(
  rating: 5,
  review: "Une de mes pièces de théâtre préférées !",
  user_journey: user_journey_chris_1,
  content: music17th_6,
  completed: true,
  position: 6
)

# one user journey
user_journey_chris_2 = UserJourney.create!(
  journey: music_4,
  user: chris,
  completed: false
)

# one user journey
user_journey_chris_3 = UserJourney.create!(
  journey: architecture_4,
  user: chris,
  completed: true
)



















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
