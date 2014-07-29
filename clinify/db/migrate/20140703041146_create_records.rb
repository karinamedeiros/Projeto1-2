class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :symptom
      t.string :exams
      t.string :bloodPress
      t.string :heartBeat
      t.string :history
      t.string :observation
      t.belongs_to :user

      t.timestamps
    end
  end
end
