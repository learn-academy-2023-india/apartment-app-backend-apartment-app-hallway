require "rails_helper"

RSpec.describe "Apartments", type: :request do
  let(:user) { User.create(email: "janet.doezer@gmail.com", password: "password123", password_confirmation: "password123") }

  # Endpoints for the apartments controller
  before do
    user.apartments.create!(
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
      manager: "Janet Doezer",
      email: "janet.doezer@gmail.com"
    )
  end

  describe "GET /index" do
    it "gets a list of apartments" do
      get "/apartments"

      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json.length).to eq 1
      expect(json.first["street"]).to eq "101 Rimrock"
    end
  end

  describe "POST /create" do
    it "creates an apartment" do
      apartment_params = {
        apartment: {
          street: "720 Second Avenue",
          unit: "508",
          city: "San Diego",
          state: "CA",
          square_footage: 700,
          price: "2500",
          bedrooms: 2,
          bathrooms: 2.0,
          pets: "Yes",
          image: "http://tinyurl.com/yc2c33b7",
          manager: "Janet Doezer",
          email: "janet.doezer@gmail.com",
          user_id: user.id
        }
      }

      expect {
        post "/apartments", params: apartment_params
      }.to change(Apartment, :count).by(1)

      expect(response).to have_http_status(200)
      apartment = Apartment.last
      expect(apartment.street).to eq "720 Second Avenue"
    end
  end

  describe "PATCH /update" do
    it "updates an apartment" do
      apartment = user.apartments.first

      updated_apartment_params = {
        apartment: {
          price: "1900" 
        }
      }

      patch "/apartments/#{apartment.id}", params: updated_apartment_params

      updated_apartment = Apartment.find(apartment.id)
      expect(response).to have_http_status(200)
      expect(updated_apartment.price).to eq "1900"
    end
  end

# Validations for the apartments controller
it "does not create an apartment without a street" do
    apartment_params = {
      apartment: {
        city: "San Diego",
        unit: "9A",
        state: "CA",
        square_footage: 500,
        manager: "Janet Doezer",
        email: "janet.doezer@gmail.com",
        price: "1800",
        bedrooms: 2,
        bathrooms: 2.0,
        pets: "Yes",
        image: "http://tinyurl.com/bdf8wvhj",
        user_id: user.id
      }
    }
  
    post "/apartments", params: apartment_params
    expect(response).to have_http_status(422)
    json = JSON.parse(response.body)
    expect(json["street"]).to include "can't be blank"
  end
  
  it "does not create an apartment without a city" do
    apartment_params = {
      apartment: {
        street: "101 Rimrock",
        unit: "9A",
        state: "CA",
        square_footage: 500,
        manager: "Janet Doezer",
        email: "janet.doezer@gmail.com",
        price: "1800",
        bedrooms: 2,
        bathrooms: 2.0,
        pets: "Yes",
        image: "http://tinyurl.com/bdf8wvhj",
        user_id: user.id
      }
    }
  
    post "/apartments", params: apartment_params
    expect(response).to have_http_status(422)
    json = JSON.parse(response.body)
    expect(json["city"]).to include "can't be blank"
  end
  
  it "does not create an apartment without a state" do
    apartment_params = {
      apartment: {
        street: "101 Rimrock",
        unit: "9A",
        city: "San Diego",
        square_footage: 500,
        manager: "Janet Doezer",
        email: "janet.doezer@gmail.com",
        price: "1800",
        bedrooms: 2,
        bathrooms: 2.0,
        pets: "Yes",
        image: "http://tinyurl.com/bdf8wvhj",
        user_id: user.id
      }
    }
  
    post "/apartments", params: apartment_params
    expect(response).to have_http_status(422)
    json = JSON.parse(response.body)
    expect(json["state"]).to include "can't be blank"
  end

  it "does not create an apartment without a unit" do
    apartment_params = {
      apartment: {
        street: "101 Rimrock",
        city: "San Diego",
        state: "CA",
        square_footage: 500,
        email: "janet.doezer@gmail.com",
        price: "1800",
        bedrooms: 2,
        bathrooms: 2.0,
        pets: "Yes",
        image: "http://tinyurl.com/bdf8wvhj",
        user_id: user.id
      }
    }

    post "/apartments", params: apartment_params
    expect(response).to have_http_status(422)
    json = JSON.parse(response.body)
    expect(json["unit"]).to include "can't be blank"
  end

  it "does not create an apartment without a square footage" do
    apartment_params = {
      apartment: {
        street: "101 Rimrock",
        unit: "9A", 
        city: "San Diego",
        state: "CA",
        email: "janet.doezer@gmail.com",
        price: "1800",
        bedrooms: 2,
        bathrooms: 2.0,
        pets: "Yes",
        image: "http://tinyurl.com/bdf8wvhj",
        user_id: user.id
      }
    }
  end
  
  it "does not create an apartment without a manager" do
    apartment_params = {
      apartment: {
        street: "101 Rimrock",
        unit: "9A",
        city: "San Diego",
        state: "CA",
        square_footage: 500,
        email: "janet.doezer@gmail.com",
        price: "1800",
        bedrooms: 2,
        bathrooms: 2.0,
        pets: "Yes",
        image: "http://tinyurl.com/bdf8wvhj",
        user_id: user.id
      }
    }
  
    post "/apartments", params: apartment_params
    expect(response).to have_http_status(422)
    json = JSON.parse(response.body)
    expect(json["manager"]).to include "can't be blank"
  end
  
  it "does not create an apartment without an email" do
    apartment_params = {
      apartment: {
        street: "101 Rimrock",
        unit: "9A",
        city: "San Diego",
        state: "CA",
        square_footage: 500,
        manager: "Janet Doezer",
        price: "1800",
        bedrooms: 2,
        bathrooms: 2.0,
        pets: "Yes",
        image: "http://tinyurl.com/bdf8wvhj",
        user_id: user.id
      }
    }
  
    post "/apartments", params: apartment_params
    expect(response).to have_http_status(422)
    json = JSON.parse(response.body)
    expect(json["email"]).to include "can't be blank"
  end
  
  it "does not create an apartment without a price" do
    apartment_params = {
      apartment: {
        street: "101 Rimrock",
        city: "San Diego",
        state: "CA",
        manager: "Janet Doezer",
        email: "janet.doezer@gmail.com",
        bedrooms: 2,
        bathrooms: 2.0,
        pets: "Yes",
        image: "http://tinyurl.com/bdf8wvhj",
        user_id: user.id
      }
    }
  
    post "/apartments", params: apartment_params
    expect(response).to have_http_status(422)
    json = JSON.parse(response.body)
    expect(json["price"]).to include "can't be blank"
  end
  
  it "does not create an apartment without bedrooms" do
    apartment_params = {
      apartment: {
        street: "101 Rimrock",
        city: "San Diego",
        state: "CA",
        manager: "Janet Doezer",
        email: "janet.doezer@gmail.com",
        price: "1800",
        bathrooms: 2.0,
        pets: "Yes",
        image: "http://tinyurl.com/bdf8wvhj",
        user_id: user.id
      }
    }
  
    post "/apartments", params: apartment_params
    expect(response).to have_http_status(422)
    json = JSON.parse(response.body)
    expect(json["bedrooms"]).to include "can't be blank"
  end
  
  it "does not create an apartment without bathrooms" do
    apartment_params = {
      apartment: {
        street: "101 Rimrock",
        city: "San Diego",
        state: "CA",
        manager: "Janet Doezer",
        email: "janet.doezer@gmail.com",
        price: "1800",
        bedrooms: 2,
        pets: "Yes",
        image: "http://tinyurl.com/bdf8wvhj",
        user_id: user.id
      }
    }
  
    post "/apartments", params: apartment_params
    expect(response).to have_http_status(422)
    json = JSON.parse(response.body)
    expect(json["bathrooms"]).to include "can't be blank"
  end
  
  it "does not create an apartment without pets information" do
    apartment_params = {
      apartment: {
        street: "101 Rimrock",
        city: "San Diego",
        state: "CA",
        manager: "Janet Doezer",
        email: "janet.doezer@gmail.com",
        price: "1800",
        bedrooms: 2,
        bathrooms: 2.0,
        image: "http://tinyurl.com/bdf8wvhj",
        user_id: user.id
      }
    }
  
    post "/apartments", params: apartment_params
    expect(response).to have_http_status(422)
    json = JSON.parse(response.body)
    expect(json["pets"]).to include "can't be blank"
  end
  
  it "does not create an apartment without an image" do
    apartment_params = {
      apartment: {
        street: "101 Rimrock",
        city: "San Diego",
        state: "CA",
        manager: "Janet Doezer",
        email: "janet.doezer@gmail.com",
        price: "1800",
        bedrooms: 2,
        bathrooms: 2.0,
        pets: "Yes",
        user_id: user.id
      }
    }
  
    post "/apartments", params: apartment_params
    expect(response).to have_http_status(422)
    json = JSON.parse(response.body)
    expect(json["image"]).to include "can't be blank"
  end
  
  it "does not create an apartment without a user" do
    apartment_params = {
      apartment: {
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
      }
    }
  
    post "/apartments", params: apartment_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json["user_id"]).to include "can't be blank"
  end 
end