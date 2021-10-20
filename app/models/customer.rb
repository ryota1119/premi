class Customer < ApplicationRecord
  has_many :contact_persons, dependent: :destroy
  accepts_nested_attributes_for :contact_persons
  validates :customer_company, presence: true
end
