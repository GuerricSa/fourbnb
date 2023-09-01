# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

DESCRIPTION = [
  "Un four haute performance conçu pour répondre aux besoins les plus exigeants en matière de cuisson. Sa technologie de convection avancée assure une répartition uniforme de la chaleur, garantissant des résultats de cuisson parfaits à chaque fois.",
  "Le four idéal pour les amateurs de pâtisserie ! Doté de multiples réglages de température et de modes de cuisson, il vous permet de réaliser des pâtisseries dignes d'un chef pâtissier.",
  "Un compagnon de cuisine polyvalent qui offre non seulement des options de cuisson traditionnelles, mais aussi des fonctions de cuisson à la vapeur et de rôtissage. Vous pourrez préparer une large variété de plats avec facilité.",
  "Le choix des professionnels de la cuisine, ce four professionnel combine une puissance exceptionnelle avec une précision inégalée. Sa capacité à maintenir des températures constantes en fait l'outil parfait pour les plats nécessitant une cuisson longue.",
  "Avec son design élégant et ses fonctionnalités modernes, ce four s'intègre parfaitement dans n'importe quelle cuisine contemporaine. Ses commandes tactiles intuitives le rendent facile à utiliser pour tous les niveaux de cuisiniers.",
  "Un four compact idéal pour les petits espaces. Ne vous laissez pas tromper par sa taille, car il offre des performances de cuisson exceptionnelles et s'adapte parfaitement à vos besoins quotidiens.",
  "Cuisinez comme un chef avec ce four intelligent. Grâce à sa connectivité Wi-Fi, vous pouvez contrôler et ajuster les réglages de cuisson à distance, vous assurant que chaque plat est préparé à la perfection.",
  "Ce four à convection vous permet de cuisiner plus rapidement tout en économisant de l'énergie. Sa technologie de pointe garantit une circulation d'air optimale pour une cuisson homogène et rapide.",
  "Réalisez des grillades, des rôtis juteux et des plats savoureux avec ce four équipé d'un gril puissant. Les amateurs de viande apprécieront les résultats dignes d'un barbecue qu'il produit.",
  "Une véritable innovation dans le monde de la cuisine, ce four à induction utilise la chaleur magnétique pour cuire vos aliments. Il offre un contrôle précis de la température pour des plats toujours réussis.",
  "Explorez la cuisine à la vapeur avec ce four à vapeur haut de gamme. Préservez les nutriments et les saveurs tout en cuisant de manière rapide et efficace. Parfait pour les régimes alimentaires sains.",
  "Ajoutez une touche rustique à votre cuisine avec ce four à bois traditionnel. Parfait pour la cuisson de pizzas, de pains et de plats rôtis, il ravira les amoureux de la cuisine authentique.",
  "Optez pour la polyvalence avec ce four à air chaud. Des options de cuisson multiples, une distribution homogène de la chaleur et une fonction de déshydratation en font un outil incontournable pour les chefs créatifs.",
  "Faites l'expérience de la cuisson en plein air à l'intérieur avec ce four doté d'une fonction de fumage. Impressionnez vos convives avec des saveurs fumées uniques pour vos viandes et légumes.",
  "Un four autonettoyant qui rend la corvée de nettoyage post-cuisson obsolète. Profitez de plus de temps pour déguster vos créations culinaires plutôt que de frotter les parois du four.",
  "Cuisinez avec précision grâce à ce four équipé d'une sonde thermique intégrée. Surveillez la température interne de vos plats en temps réel pour des résultats dignes d'un chef étoilé.",
  "Un design élégant rencontre une technologie de pointe. Ce four à écran tactile offre une interface conviviale pour sélectionner les réglages de cuisson parmi une variété de modes disponibles.",
  "Préparez des plats familiaux grâce à ce four à grande capacité. Que ce soit pour une dinde de Thanksgiving ou une série de pizzas pour une fête, il répondra à tous vos besoins culinaires.",
  "Un four conçu pour les passionnés de cuisine qui aiment expérimenter. Avec ses nombreux réglages personnalisables, il vous permet de laisser libre cours à votre créativité derrière les fourneaux.",
  "Profitez d'une cuisson saine avec ce four à convection équipé d'options de cuisson sans huile. Découvrez des saveurs délicieusement croustillantes sans la nécessité d'ajouter de matières grasses."
].freeze

ADDRESSES = [
  "1 rue de la Tour Eiffel, Paris",
  "2 avenue des Champs-Élysées, Paris",
  "3 rue du Louvre, Paris",
  "4 rue du Marais, Paris",
  "5 boulevard Saint-Germain, Paris",
  "6 place Bellecour, Lyon",
  "7 rue de la Croix-Rousse, Lyon",
  "8 quai Victor Augagneur, Lyon",
  "9 rue du Vieux Lyon, Lyon",
  "10 avenue Jean Jaurès, Lyon",
  "11 rue de la Grand Place, Lille",
  "12 avenue du Général de Gaulle, Lille",
  "13 rue de la Citadelle, Lille",
  "14 place du Théâtre, Rennes",
  "15 rue Saint-Michel, Rennes",
  "16 boulevard de la Liberté, Rennes",
  "17 rue du Parlement, Strasbourg",
  "18 quai des Bateliers, Strasbourg",
  "19 place de la Cathédrale, Strasbourg",
  "20 rue des Juifs, Strasbourg"
].freeze

AVIS = [
  "Ce four est incroyable ! Il cuit les aliments de manière homogène et rapide.",
  "J'adore ce four, il a tellement d'options de cuisson différentes.",
  "Malheureusement, ce four a tendance à surchauffer, ce qui peut brûler les plats.",
  "Un excellent rapport qualité-prix. Simple à utiliser même pour un débutant en cuisine.",
  "Je suis impressionné par la qualité de cuisson de ce four, même à des températures basses.",
  "Les commandes digitales de ce four sont parfois déroutantes à utiliser.",
  "Ce four a révolutionné ma façon de cuisiner. Je ne peux plus m'en passer.",
  "La fonction de convection de ce four donne des résultats exceptionnels.",
  "Je suis déçu de la durabilité de ce four. Il a commencé à montrer des signes de défaillance après seulement un an.",
  "Un four élégant qui s'intègre parfaitement dans ma cuisine moderne.",
  "Les pains et pâtisseries sortent toujours parfaitement dorés et cuits à point de ce four.",
  "Je trouve que les réglages de température ne sont pas toujours précis sur ce four.",
  "Ce four chauffe rapidement, ce qui est idéal lorsque je suis pressé.",
  "Les options de connectivité de ce four avec le smartphone sont plus gadgets qu'autre chose.",
  "J'ai eu des problèmes avec la porte du four qui ne se ferme pas correctement à certains moments.",
  "Ce four consomme moins d'énergie que mon ancien modèle, ce qui est un avantage considérable.",
  "Les joints en caoutchouc de la porte semblent s'user rapidement sur ce four.",
  "Je suis étonné par la capacité de cuisson de ce four. Il peut facilement accueillir de grands plats.",
  "Le préchauffage de ce four est assez rapide, ce qui permet de gagner du temps.",
  "Les modes de cuisson prédéfinis de ce four ne correspondent pas toujours à mes besoins."
]

puts "Destroying all users and ovens..."
Review.destroy_all
Booking.destroy_all
Oven.destroy_all
User.destroy_all
puts "Done!"

puts "Creating users..."
20.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    password: "123456"
  )
  file = URI.open("https://source.unsplash.com/random/?avatar,face")
  user.avatar.attach(io: file, filename: "avatar#{user.id}.png", content_type: "image/png")
  user.save
end
puts "Completed!"

puts "Creating ovens..."
User.all.each do |user|
  (1..2).to_a.sample.times do
    oven = Oven.new(
      brand: Faker::Appliance.brand,
      user_id: user.id,
      address: ADDRESSES.sample,
      description: DESCRIPTION.sample,
      title: "#{Faker::Adjective.positive} #{["four", "grill"].sample}",
      price: (5..30).to_a.sample
    )
    [1, 1, 5].sample.times do
      # index = (0..8).to_a.sample
      file = URI.open("https://source.unsplash.com/random/?oven")
      oven.photos.attach(io: file, filename: "photo#{oven.id}.png", content_type: "image/png")
      oven.save
    end
  end
end
puts "Finished!"

puts "Creating bookings"
50.times do
  booking = Booking.new(
    oven_id: Oven.all.sample.id,
    user_id: User.all.sample.id,
    date: Time.now + (3600 * rand(1..168)),
    time: rand(1..5),
    status: %w[pending accepted declined].sample,
    
  )
  booking.total = booking.time * Oven.find(booking.oven_id).price
  booking.save
end
puts "finished"

puts "Creating reviews"
Booking.all.each do |booking|
  Review.create(
    rating: rand(1..5),
    content: AVIS.sample,
    booking_id: booking.id
  )
end
puts "Finished!"

puts "Creating 'Maité'..."
truc = User.new(
  email: "maite@gmail.com",
  first_name: "Maité",
  password: "123456"
)
truc_avatar = URI.open("https://www.parismatch.com/lmnr/var/pm/public/media/image/2022/03/02/07/La-Cuisine-des-Mousquetaires-Que-devient-la-cuisiniere-Maite.jpg?VersionId=Bx1BN4WaCcUbOhuMd3mq5Y9ijidHeqJm")
truc.avatar.attach(io: truc_avatar, filename: "maite.png", content_type: "image/png")
truc.save
puts "'Maité' is alive!"
