class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    add_index :pacients, :email, unique: true
  end
end
