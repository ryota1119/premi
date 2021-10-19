class Customer < ApplicationRecord
  has_many :contact_person
  validates :customer_company, presence: true
end
