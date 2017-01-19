class Order < ApplicationRecord
  belongs_to :user
  validates :number_of_cans, :water_brand, :address, :mobile, :presence => true
  validates :mobile, phone: { possible: true, types: [:voip, :mobile], country_specifier: -> phone { "IN" } }
end
