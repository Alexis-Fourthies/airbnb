class AddIdToListing < ActiveRecord::Migration[5.2]
  def change
    add_reference :listings, :city, foreign_key: true, dependent: :destroy
    add_reference :listings, :user, foreign_key: true, dependent: :destroy
  end
end
