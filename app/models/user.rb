class User < ApplicationRecord
    # email obligatoire et répond au regex d'un email
    validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
    # phone_number obligatoire et répond au regex format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "please enter a valid french number" }
    validates :phone_number, presence: true, format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "please enter a valid french number" }
    # user peut avoir plusieurs réservations : il devient alors un guest
    has_many :reservations
    # user peut être administrateur de plusieurs listings
    has_many :listings, through: :reservations
end
