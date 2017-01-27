class Order < ApplicationRecord
  include AASM

  aasm :column => 'state' do
  end
  belongs_to :user
  validates :cans, :water_brand, :address, :mobile, :presence => true
  validates :mobile, phone: { possible: true, types: [:voip, :mobile], country_specifier: -> phone { "IN" } }

  aasm do
    state :created, :initial => true
    state :confirmed, :delivered ,:cancelled

    event :confirm do
      transitions :from => :created, :to => :confirmed
    end

    event :deliver do
      transitions :from => :confirmed, :to => :delivered
    end

    event :cancel do
      transitions :from => :created, :to => :cancelled
    end
  end
end
