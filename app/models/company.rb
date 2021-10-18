class Company < ApplicationRecord
  belongs_to :user
  validates :company_name, presence: true
  validates :tel, presence: true
  validates :fax, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
end
