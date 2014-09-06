class Event < ActiveRecord::Base
  belongs_to :user

  validates :nome, presence: true

  ROLES = %i[admin patient]

  def admin?
  	return role == 'admin'
  end

end
