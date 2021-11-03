class EstimateDetail < ApplicationRecord
  belongs_to :estimate
  belongs_to :item
  validates :volume, :price, presence: true
end
