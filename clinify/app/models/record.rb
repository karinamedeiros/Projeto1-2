class Record < ActiveRecord::Base
	belongs_to :user
	validates :symptom, :bloodPress, :heartBeat, :history, presence: true
	validates :observation, length: {maximum: 100}
end
