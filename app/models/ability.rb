class Ability
  include CanCan::Ability
  def initialize(user)
    if user.present? && user.role.name == "admin"   
      can :manage, :all
    # cannot :create, Issuedbook
  else
    user&.role&.name == "user"
    can %i[read], Book
    can %i[read], Issuedbook, user: user
  end
end
end



