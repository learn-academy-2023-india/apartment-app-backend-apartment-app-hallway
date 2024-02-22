require "rails_helper"

RSpec.describe Apartment, type: :model do
  let(:user) { User.create(
    email: "janet.doezer@gmail.com",
    password: "password",
    password_confirmation: "password"
  )}

  it "should validate street" do
    apartment = user.apartments.create(
      unit: "9A",
      city: "San Diego",
      state: "CA",
      square_footage: 500,
      price: "1800",
      bedrooms: 2,
      bathrooms: 2.0,
      pets: "Yes",
      image: "http://tinyurl.com/bdf8wvhj",
      manager: "Janet Doezer",
      email: "janet.doezer@gmail.com"
    )
    expect(apartment.errors[:street]).to include("can't be blank")
  end

  it "should validate unit" do
    apartment = user.apartments.create(
      street: "101 Rimrock",
      city: "San Diego",
      state: "CA",
      square_footage: 500,
      price: "1800",
      bedrooms: 2,
      bathrooms: 2.0,
      pets: "Yes",
      image: "http://tinyurl.com/bdf8wvhj",
      manager: "Janet Doezer",
      email: "janet.doezer@gmail.com"
    )
    expect(apartment.errors[:unit]).to include("can't be blank")
  end

  it "should validate city" do 
    apartment = user.apartments.create(
      street: "101 Rimrock",
      state: "CA",
      square_footage: 500,
      price: "1800",
      bedrooms: 2,
      bathrooms: 2.0,
      pets: "Yes",
      image: "http://tinyurl.com/bdf8wvhj",
      manager: "Janet Doezer",
      email: "janet.doezer@gmail.com"
    )
    expect(apartment.errors[:city]).to include("can't be blank")
  end

  it "should validate state" do 
    apartment = user.apartments.create(
      street: "101 Rimrock",
      city: "San Diego",
      square_footage: 500,
      price: "1800",
      bedrooms: 2,
      bathrooms: 2.0,
      pets: "Yes",
      image: "http://tinyurl.com/bdf8wvhj",
      manager: "Janet Doezer",
      email: "janet.doezer@gmail.com"
    )
    expect(apartment.errors[:state]).to include("can't be blank")
  end

  it "should validate square_footage" do 
    apartment = user.apartments.create(
      street: "101 Rimrock",
      city: "San Diego",
      state: "CA",
      price: "1800",
      bedrooms: 2,
      bathrooms: 2.0,
      pets: "Yes",
      image: "http://tinyurl.com/bdf8wvhj",
      manager: "Janet Doezer",
      email: "janet.doezer@gmail.com"
    )
    expect(apartment.errors[:square_footage]).to include("can't be blank")
  end

  it "should validate price" do 
    apartment = user.apartments.create(
      street: "101 Rimrock",
      city: "San Diego",
      state: "CA",
      square_footage: 500,
      bedrooms: 2,
      bathrooms: 2.0,
      pets: "Yes",
      image: "http://tinyurl.com/bdf8wvhj",
      manager: "Janet Doezer",
      email: "janet.doezer@gmail.com"
    )
    expect(apartment.errors[:price]).to include("can't be blank")
  end

  it "should validate bedrooms" do 
    apartment = user.apartments.create(
      street: "101 Rimrock",
      city: "San Diego",
      state: "CA",
      square_footage: 500,
      price: "1800",
      bathrooms: 2.0,
      pets: "Yes",
      image: "http://tinyurl.com/bdf8wvhj",
      manager: "Janet Doezer",
      email: "janet.doezer@gmail.com"
    )
    expect(apartment.errors[:bedrooms]).to include("can't be blank")
  end

  it "should validate bathrooms" do 
    apartment = user.apartments.create(
      street: "101 Rimrock",
      city: "San Diego",
      state: "CA",
      square_footage: 500,
      price: "1800",
      bedrooms: 2,
      pets: "Yes",
      image: "http://tinyurl.com/bdf8wvhj",
      manager: "Janet Doezer",
      email: "janet.doezer@gmail.com"
    )
    expect(apartment.errors[:bathrooms]).to include("can't be blank")
  end

  it "should validate pets" do 
    apartment = user.apartments.create(
      street: "101 Rimrock",
      city: "San Diego",
      state: "CA",
      square_footage: 500,
      price: "1800",
      bedrooms: 2,
      bathrooms: 2.0,
      image: "http://tinyurl.com/bdf8wvhj",
      manager: "Janet Doezer",
      email: "janet.doezer@gmail.com"
    )
    expect(apartment.errors[:pets]).to include("can't be blank")
  end

  it "should validate image" do 
    apartment = user.apartments.create(
      street: "101 Rimrock",
      city: "San Diego",
      state: "CA",
      square_footage: 500,
      price: "1800",
      bedrooms: 2,
      bathrooms: 2.0,
      pets: "Yes",
      manager: "Janet Doezer",
      email: "janet.doezer@gmail.com"
    )
    expect(apartment.errors[:image]).to include("can't be blank")
  end

  it "should validate user_id" do 
    apartment = Apartment.new(
      street: "101 Rimrock",
      city: "San Diego",
      state: "CA",
      square_footage: 500,
      price: "1800",
      bedrooms: 2,
      bathrooms: 2.0,
      pets: "Yes",
      image: "http://tinyurl.com/bdf8wvhj",
      manager: "Janet Doezer",
      email: "janet.doezer@gmail.com"
    )
    apartment.valid?
    expect(apartment.errors[:user]).to include("must exist")
  end

  it "should validate manager" do
    apartment = user.apartments.create(
      street: "101 Rimrock",
      unit: "9A",
      city: "San Diego",
      state: "CA",
      square_footage: 500,
      price: "1800",
      bedrooms: 2,
      bathrooms: 2.0,
      pets: "Yes",
      image: "http://tinyurl.com/bdf8wvhj",
      email: "janet.doezer@gmail.com"
    )
    expect(apartment.errors[:manager]).to include("can't be blank")
  end

  it "should validate email" do
    apartment = user.apartments.create(
      street: "101 Rimrock",
      unit: "9A",
      city: "San Diego",
      state: "CA",
      square_footage: 500,
      price: "1800",
      bedrooms: 2,
      bathrooms: 2.0,
      pets: "Yes",
      image: "http://tinyurl.com/bdf8wvhj",
      manager: "Janet Doezer"
    )
    expect(apartment.errors[:email]).to include("can't be blank")
  end
end