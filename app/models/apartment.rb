class Apartment < ApplicationRecord
  belongs_to :user
  validates :street, :unit, :city, :state, :square_footage, :price, :bathrooms, :bedrooms, :pets, :manager, :email, :image, :user_id, presence: true
end 

