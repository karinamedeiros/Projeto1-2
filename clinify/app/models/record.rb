class Record < ActiveRecord::Base
	
	belongs_to :user
	has_many :exams, :as => :attachable 
	mount_uploader :exams, ExamsUploader 
	validates :symptom, :bloodPress, :heartBeat, :history, presence: true
	validates :observation, length: {maximum: 100}
end
