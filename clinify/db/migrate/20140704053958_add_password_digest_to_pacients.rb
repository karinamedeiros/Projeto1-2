class AddPasswordDigestToPacients < ActiveRecord::Migration
  def change
    add_column :pacients, :password_digest, :string
  end
end
