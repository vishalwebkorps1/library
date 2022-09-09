class Issuedbook < ApplicationRecord
  belongs_to :book
  belongs_to :user
 
  # validates :book_id, presence: true
  # validates :issued_on, presence: true
  # validates :user_id, presence: true
  # validates :fine, presence: true
  # validates :submittion, presence: true    
end




