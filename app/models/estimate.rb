class Estimate < ApplicationRecord
  has_many :estimate_details, dependent: :destroy
  belongs_to :customer
  belongs_to :user
  belongs_to :contact_person
end
