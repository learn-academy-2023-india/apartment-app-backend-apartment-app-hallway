class Apartment < ApplicationRecord
  belongs_to :user
  validates :street, :unit, :city, :user_id, :image, :pets, :bathrooms, :bedrooms, :price, :square_footage, :state, presence: true
end 

