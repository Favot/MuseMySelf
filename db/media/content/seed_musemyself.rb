

# Topic

puts 'Seeding topics'

music = Topic.new(name: 'Musique')
file = File.open(Rails.root.join('db/media/topics/music.jpg'))
music.photo.attach(io: file, filename: 'music.jpg', content_type: 'images/jpg')
music.save!

art = Topic.new(name: 'Histoire de l\'Art')
file = File.open(Rails.root.join('db/media/topics/art.jpg'))
art.photo.attach(io: file, filename: 'art.jpg', content_type: 'images/jpg')
art.save!

 = Topic.new(name: '')
file = File.open(Rails.root.join('db/media/topics/...'))
.photo.attach(io: file, filename: '...', content_type: 'images/...')
.save!


# Journey

puts 'Seeding journeys'

# music

music_18th = Journey.new(
  name: 'Opéra du XVIIIe siècle : Haendel & Mozart',
  summary: 'Découvrez l\'opéra baroque et classique à travers le Giulio Cesare de Haendel et le Don Giovanni de Mozart.',
  topic: music
)

file = File.open(Rails.root.join('db/media/journeys/music_18th.jpg'))
music_18th.photo.attach(io: file, filename: 'music_18th.jpg', content_type: 'image/jpg')
music_18th.save!

music_19th = Journey.new(
  name: 'Opéra du XIXe siècle : Meyerbeer, Wagner, & Verdi',
  summary: 'Découvrez la musique et l\'impact culturel de trois opéras canoniques des années 1800 : Les Huguenots, Das Rheingold, et Otello.',
  topic: music
)

file = File.open(Rails.root.join('db/media/journeys/music_19th.jpg'))
music_19th.photo.attach(io: file, filename: 'music_19th.jpg', content_type: 'image/jpg')
music_19th.save!

# art

art_european_paintings = Journey.new(
  name: 'Peinture européene de 1400 à 1800',
  summary: 'Découvrez le travail inspirant des principaux peintres européens de 1400 à 1800 environ, et explorez les questions exprimées par l\'art de la peinture.',
  topic: art
)

file = File.open(Rails.root.join('db/media/journeys/art_european_paintings.jpg'))
art_european_paintings.photo.attach(io: file, filename: 'art_european_paintings.jpg', content_type: 'image/jpg')
art_european_paintings.save!

art_superheroes = Journey.new(
  name: 'L\'essor des superhéros et leur impact sur la culture pop',
  summary: 'Rejoignez la légende de l\'industrie de la bande dessinée, le regretté Stan Lee, pour explorer l\'histoire de la bande dessinée et la montée des super-héros.',
  topic: art
)

file = File.open(Rails.root.join('db/media/journeys/art_superheroes.jpg'))
art_superheroes.photo.attach(io: file, filename: 'art_superheroes.jpg', content_type: 'image/jpg')
art_superheroes.save!

art_japan = Journey.new(
  name: 'Livres japonais : Du manuscrit à l\'impression',
  summary: '',
  topic: art
)

file = File.open(Rails.root.join('db/media/journeys/art_japan.jpg'))
art_japan.photo.attach(io: file, filename: 'art_japan.jpg', content_type: 'image/jpg')
art_japan.save!



































puts 'Finished'
