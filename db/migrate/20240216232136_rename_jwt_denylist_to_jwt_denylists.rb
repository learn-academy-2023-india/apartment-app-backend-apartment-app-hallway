class RenameJwtDenylistToJwtDenylists < ActiveRecord::Migration[7.1]
  def change
    rename_table :jwt_denylist, :jwt_denylists
  end
end