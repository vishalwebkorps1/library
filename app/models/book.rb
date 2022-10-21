class Book < ApplicationRecord
    include PublicActivity::Model
    tracked

    # Association
    belongs_to :user, optional: true
    has_many :issuedbooks, dependent: :destroy
    # Validations
    validates :name, presence: true,
                    uniqueness: {case_sensitive: false},
                    length: {minimum: 4, maximum: 300}

    validates :author, presence: true,
                                    length: {minimum: 4, maximum: 300}

    validates :description, presence: true,
                                length: {minimum: 8, maximum: 400}

    validates :user_id, presence: true

    validates :quantity, presence: true

    validates :edition, presence: true
end


