class Estimate < ApplicationRecord
  has_many :estimate_details, dependent: :destroy
end
