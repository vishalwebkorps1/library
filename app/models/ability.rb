class Ability
  include CanCan::Ability

  def initialize(user)
    
   

    if user.present? && user.role.name == "admin"
        
      can :manage, :all
      # cannot :create, Issuedbook

    else
      
       user.role.name == "student"
        can %i[read], Book
        can %i[profile], User, user: user
        can %i[read issue return], Issuedbook, user: user
      end
    end 
  end

  

