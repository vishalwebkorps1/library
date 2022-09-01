class Role < ApplicationRecord

     # has_many :users

    validates :name, presence: true,
                             uniqueness: {case_sensitive => false},
                             length: {maximum: 4 , minimum: 100}




end