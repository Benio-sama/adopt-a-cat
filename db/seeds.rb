# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Cat.destroy_all
User.destroy_all

u = User.create!(
  name: "test",
  email: "test@test.hu",
  password: "test123",
  password_confirmation: "test123"
)

Cat.create!([
  {
    name: "Mici",
    age: 2,
    gender: 1,
    spayed_or_neutered: true,
    tags: ["Tabby", "Bújós", "Szobatiszta"],
    images: ["cat1.jpg", "cat2.jpg", "cat3.jpg"],
    desc: ["Mici egy rendkívül barátságos, bújós cica. Nagyon szereti a gyerekeket, teljesen szobatiszta és békés természetű."],
    user_id: u.id 
  },
  {
    name: "Cirmi",
    age: 1,
    gender: 0,
    spayed_or_neutered: false,
    tags: ["Orange", "Játékos", "Energikus"],
    images: ["cat9.jpg", "cat4.jpg", "cat5.jpg"],
    desc: ["Cirmi egy energikus, kíváncsi fiatal kandúr. Imád játszani, kertes házba vagy aktív gazdinak ideális választás."],
    user_id: nil
  },
  {
    name: "Foltos",
    age: 3,
    gender: 0,
    spayed_or_neutered: true,
    tags: ["Tuxedo", "Nyugodt", "Fekete-fehér"],
    images: ["cat6.jpg", "cat7.jpg"],
    desc: ["Foltos egy kiegyensúlyozott, nyugodt felnőtt cica. Szeret az ablakban napozni és dorombolni."],
    user_id: nil
  },
  {
    name: "Hógolyó",
    age: 4,
    gender: 1,
    spayed_or_neutered: true,
    tags: ["White", "Csendes"],
    images: ["cat8.jpg"],
    desc: ["Csendes, tiszta fehér bundájú cica, aki egyedüli kedvencként érzi magát a legjobban."],
    user_id: nil
  }
])