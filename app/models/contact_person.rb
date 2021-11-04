class ContactPerson < ApplicationRecord
  has_one :estimate, dependent: :destroy
  belongs_to :customer
  validates :name, presence: true
end
