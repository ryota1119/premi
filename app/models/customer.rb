class Customer < ApplicationRecord
  has_many :contact_persons, dependent: :destroy
  has_many :estimates, dependent: :destroy
  belongs_to :user
  validates :company_name, presence: true
end
