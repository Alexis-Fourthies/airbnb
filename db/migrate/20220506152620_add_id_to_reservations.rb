class AddIdToReservations < ActiveRecord::Migration[5.2]
  def change
    add_reference :reservations, :listing, foreign_key: true, dependent: :destroy
    add_reference :reservations, :user, foreign_key: true, dependent: :destroy
  end
end
