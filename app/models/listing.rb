class Listing < ApplicationRecord
    # available_beds obligatoire et strictement positif
    validates :available_beds, presence: true, numericality: { greater_than: 0 }
    # price est le prix pour une nuit, nombre entier uniquement, strictement positif et obligatoire
    validates :price, presence: true, numericality: { greater_than: 0 }, format: { with: /\A\d+\z/, message: "please enter a valid number" } 
    # description obligatoire et doit faire au moins 140 caractères
    validates :description, presence: true, length: { minimum: 140 }
    # has_wifi obligatoire
    validates :has_wifi, presence: true
    # welcome_message obligatoire
    validates :welcome_message, presence: true
    # un listing a un administrateur qui est un user
    belongs_to :user
    # un listing a plusieurs réservations
    has_many :reservations
    # un listing appartient à une ville
    belongs_to :city
end
