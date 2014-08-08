class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
        can :manage, :all
    else
        can :show, Record, :user_id => user.id        
        can [:show, :update], User, :id => user.id
    end
  end
end
