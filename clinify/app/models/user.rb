class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

	has_one :record
	after_save :create_record #creates profile at user registration
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable   

end
