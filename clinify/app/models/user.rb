class User < ActiveRecord::Base
	has_one :record

  accepts_nested_attributes_for :record

	after_save :create_record #creates record at user registration

	devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable   

  validates :name, presence: true
  validates :cpf, length: {maximum: 14}
  validates_uniqueness_of :email

  ROLES = %i[admin patient]

  def admin?
  	return role == 'admin'
  end
end
