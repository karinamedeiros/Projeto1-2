class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :cpf
      t.string :phoneHome
      t.string :phoneMobile
      t.string :address
      t.string :email
      t.string :login
      t.string :password

      t.timestamps
    end
  end
end
