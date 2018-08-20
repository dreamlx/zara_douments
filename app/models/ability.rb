class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= AdminUser.new
      if user.role == 'admin'
        can :manage, :all
      else
        can [:read,], :all
        can [:create,:update], :Post
        #cannot [:create,:update, :destroy],:User
      end
    end
end