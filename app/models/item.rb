class Item < ApplicationRecord
  belongs_to :user
  has_many :estimate_details
  validates :item_name, presence: true
end
