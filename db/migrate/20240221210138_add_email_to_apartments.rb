class AddEmailToApartments < ActiveRecord::Migration[7.1]
  def change
    add_column :apartments, :email, :string
  end
end
