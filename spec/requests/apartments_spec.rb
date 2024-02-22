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
end

