class User < ActiveRecord::Base
	has_one :record
	validates :name, presence: true
	validates :cpf, length: {maximum: 14}
	validates :phoneHome, presence: true
	validates :phoneMobile, presence: true
	validates :address, length: {maximum: 30}
	validates_uniqueness_of :email , :login
	validates :password, length: {maximum: 8}, length: {minimum: 5}
end
