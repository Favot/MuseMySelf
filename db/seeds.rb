
puts "Cleaning all databases..."

Journey.destroy_all
Content.destroy_all
User.destroy_all

puts "DB cleared"
# category : %w[Théâtre, Film, Audio, Peinture, Autre]

# Readings : Le Malade Imaginaire
# Audio : Le Malade Imaginaire, Marc-Antoine Charpentier
# Audio : Sacred music (to be identified)
# Movie : (find a movie about Louis XIII, Louis XIV, Richelieu, Mazarin, Anne d'Autriche with 17th soundtrack)
# Paintings : L'Ouïe, Abraham Bosse
# Leçons de ténèbres


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

file = File.open(Rails.root.join('db/media/content/music17th_1.jpg'))
music17th_1.photo.attach(io: file, filename: 'music17th_1.jpg', content_type: 'image/jpeg')
music17th_1.save!


music17th_2 = Content.new(
  title: "Le Malade Imaginaire",
  author: "Marc-Antoine Charpentier",
  date: 1973, # "10/02/1973"
  category: "Audio",
  duration: 90,
  url: "https://open.spotify.com/album/2sO5ltxLauCkAMK5fCckFY?si=hYlqJ4gYRKeaugclJn7wJA",
  description: "La musique d'accompagnement de l'oeuvre éponyme de Molière est un \
                chef-d'oeuvre de la musique non religieuse du XVIIe."
)

file = File.open(Rails.root.join('db/media/content/music17th_2.jpg'))
music17th_2.photo.attach(io: file, filename: 'music17th_2.jpg', content_type: 'image/jpeg')
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

file = File.open(Rails.root.join('db/media/content/music17th_3.jpg'))
music17th_3.photo.attach(io: file, filename: 'music17th_3.jpg', content_type: 'image/jpeg')
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

file = File.open(Rails.root.join('db/media/content/music17th_4.jpg'))
music17th_4.photo.attach(io: file, filename: 'music17th_4.jpg', content_type: 'image/jpeg')
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

file = File.open(Rails.root.join('db/media/content/music17th_5.jpg'))
music17th_5.photo.attach(io: file, filename: 'music17th_5.jpg', content_type: 'image/jpeg')
music17th_5.save!





puts "Creating demo journey..."
music17th_journey = Journey.name(
  name: "Voyage musical dans la France du 17e siècle",
  summary: "Ce MOOC vous propose de partir à la découverte des lieux, des musiciens \
            et des repertoires de la musique française du 17e siècle.",
  topic: music
)

puts "Linking demo journey to content..."
journey_content = Journey_content.new(
  journey: music17th_journey,
  content: music17th_1
)
journey_content.save!

journey_content = Journey_content.new(
  journey: music17th_journey,
  content: music17th_2
)
journey_content.save!

journey_content = Journey_content.new(
  journey: music17th_journey,
  content: music17th_3
)
journey_content.save!

journey_content = Journey_content.new(
  journey: music17th_journey,
  content: music17th_4
)
journey_content.save!
