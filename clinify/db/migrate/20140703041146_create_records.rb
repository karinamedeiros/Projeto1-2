class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :symptom
      t.string :exams
      t.string :bloodPress
      t.string :heartBeat
      t.string :history
      t.string :observation
      t.integer :user_id

      t.timestamps
    end
  end
end
