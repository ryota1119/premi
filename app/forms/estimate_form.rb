class EstimateForm
  include ActiveModel::Model
  # include ActiveModel::Attributes

  attr_accessor :company_name, :department, :position, :name, :effective, :note, :item_name, :volume, :price, :item_id, :user_id, :customer_id, :contact_person_id

  validates :company_name, :name, presence: true
  validates :volume, :price, presence: true

  def initialize(estimate = Estimate.new)
    @estimate = estimate
    self.attributes = @estimate.attributes if @estimate.persisted?
  end

  def save
    return false if invalid?
    customer = Customer.find_or_initialize_by(company_name: company_name, user_id: user_id)
    customer.save! if customer.new_record?
    contact_person = customer.contact_persons.find_or_initialize_by(name: name, customer_id: customer.id)
    contact_person.save! if contact_person.new_record?
    item = Item.find_or_initialize_by(item_name: item_name, user_id: user_id )
    item.save! if item.new_record?
    estimate = customer.estimates.create!(effective: effective, note: note, user_id: user_id, customer_id: customer.id, contact_person_id: contact_person.id)
    estimate.estimate_details.create!(volume: volume, price: price, item_id: item.id)
  end

end
