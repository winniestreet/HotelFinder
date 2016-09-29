class Hotel < ApplicationRecord
  validates :name, :street, :suburb, :state, :postcode, :country, presence: true
  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    [street, suburb, state, postcode, country].compact.join(',')
    #compact takes out any fields that are left blank when the form is filled out
    #join joins all the items with what's in the brackets in between the items
  end
end
