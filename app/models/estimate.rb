class Estimate < ApplicationRecord
  has_many :estimate_details, dependent: :destroy
  belongs_to :user
  belongs_to :customer
  belongs_to :contact_person
  validate :date_before_start

  def date_before_start
    return if effective.blank?
    errors.add(:effective, "は今日以降のものを選択してください") if effective < Date.today
  end

end
