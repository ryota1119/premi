class Company < ApplicationRecord
  VALID_PHONE_REGEX = /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/
  VALID_POSTNUM_REGEX = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/
  belongs_to :user
  validates :company_name, presence: true
  validates :tel, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :fax, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :postal_code, presence: true, format: { with: VALID_POSTNUM_REGEX }
  validates :address, presence: true
end
