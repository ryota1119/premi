class Company < ApplicationRecord
  VALID_PHONE_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
  VALID_POSTNUM_REGEX = /\A\d{3}[-]\d{4}\z/
  belongs_to :user
  validates :name, presence: true
  validates :tel, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :fax, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :postal_code, presence: true, format: { with: VALID_POSTNUM_REGEX }
  validates :address, presence: true
end
