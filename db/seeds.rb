user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

user1_apartments = [
  {street: 'ABC Sesame Street',
  unit: '20',
  city: 'Sesame',
  state: 'Muppet',
  square_footage: 3000,
  price: 1900,
  bedrooms: 5,
  bathrooms: 3,
  pets: 'dogs and cats only',
  image: 'http://tinyurl.com/mt5vhsyk'},
  {street: 'Elm Street',
  unit: '216',
  city: 'Scary Ville',
  state: 'Idaho',
  square_footage: 10000,
  price: 5000,
  bedrooms: 5,
  bathrooms: 5,
  pets: 'not allowed',
  image: 'http://tinyurl.com/mr28m437'}
]

user2_apartments = [
  {street: 'Soza Way',
  unit: '42',
  city: 'Miami',
  state: 'Florida',
  square_footage: 2000,
  price: 25000,
  bedrooms: 3,
  bathrooms: 2,
  pets: 'fish',
  image: 'http://tinyurl.com/4jeny2fs'},
  {street: 'Michael Street',
  unit: '216',
  city: 'Sydney',
  state: 'New South Wales',
  square_footage: 10000,
  price: 5000,
  bedrooms: 5,
  bathrooms: 5,
  pets: 'not allowed',
  image: 'http://tinyurl.com/3n4a7z4r'}
]

user1_apartments.each do |apartments|
  user1.apartments.create(apartments)
  p 'created: #{apartments}'
end

user2_apartments.each do |apartments|
  user2.apartments.create(apartments)
  p 'created: #{apartments}'
end