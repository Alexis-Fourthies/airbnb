class Reservation < ApplicationRecord
    # la start_date doit être antérieure à la end_date
    def start_date_before_end_date
        if start_date > end_date
            errors.add(:start_date, "must be before end date")
        end
    end

    # calculer la durée de la réservation
    def duration
        (end_date - start_date).to_i
    end
    # reservation doit être associée à un listing et un guest
    belongs_to :listing
    belongs_to :user
    # rendre impossible la réservation si le listing est déjà réservé à la même date
    def overlapping_reservation
        listing.reservations.where("? < end_date AND ? > start_date", start_date, end_date).exists?
    end
end
