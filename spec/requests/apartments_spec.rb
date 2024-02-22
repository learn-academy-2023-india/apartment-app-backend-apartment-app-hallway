require "rails_helper"

RSpec.describe "Apartments", type: :request do
  let(:user) { User.create(email: "janet.doezer@gmail.com", password: "password123", password_confirmation: "password123") }

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
end