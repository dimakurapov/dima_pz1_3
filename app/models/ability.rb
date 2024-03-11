class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # гость

    if user.has_role? :admin
      can :manage, Market
    elsif user.has_role? :user
      can :read, Market
    end
  end
end