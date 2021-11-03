class Estimate < ApplicationRecord
  has_many :estimate_details, dependent: :destroy
  belongs_to :user
end
