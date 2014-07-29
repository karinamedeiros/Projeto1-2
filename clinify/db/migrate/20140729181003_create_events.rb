class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :nome
      t.text :descricao
      t.datetime :inicio
      t.datetime :fim

      t.timestamps
    end
  end
end
