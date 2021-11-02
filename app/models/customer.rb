class Customer < ApplicationRecord
  has_many :contact_persons, dependent: :destroy
  has_many :estimates
  belongs_to :user
  validates :customer_company, presence: true
end
