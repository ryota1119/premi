class ContactPerson < ApplicationRecord
  has_one :estimate
  belongs_to :customer
  validates :name, presence: true
end
