class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :issuedbooks, :dependent => :delete_all
  belongs_to :role

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
         VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
         # validates :email, presence: true,
                                # length: {minimum: 5, maxmimum: 105},
        #                      uniqueness: {case_sensitive: false},
        #                      format: { with: VALID_EMAIL_REGEX }                   
                            
        # validates :address, presence: true,
        #                             length: {minimum: 8, maximum: 300}

        # validates :name, presence: true,
        #                             length: {minimum: 3}

        # validates :password, presence: true,
        #                             length: {minimum: 6, maximum: 20}



  
end



