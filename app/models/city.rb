class City < ApplicationRecord
    # name obligatoire
    validates :name, presence: true
    # zip_code au format : { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "please enter a valid french zip code" }. Obligatoire et unique
    validates :zip_code, presence: true, uniqueness: true, format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "please enter a valid french zip code" }
    # une ville peut avoir plusieurs listings
    has_many :listings
end
