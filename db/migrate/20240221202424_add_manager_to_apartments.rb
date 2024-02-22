class AddManagerToApartments < ActiveRecord::Migration[7.1]
  def change
    add_column :apartments, :manager, :string
  end
end
