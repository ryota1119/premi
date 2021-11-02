class EstimateDetail < ApplicationRecord
  belongs_to :estimate
  validates :volume, :price, presence: true
end
