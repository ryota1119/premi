class EstimateForm
  include ActiveModel::Model
  # include ActiveModel::Attributes

  attr_accessor :customer_company, :department, :position, :name, :effective, :note, :item_name, :volume, :price, :user_id

  validates :customer_company, :name, presence: true
  validates :volume, :price, presence: true

  def save
    validate!
    return false if invalid?

    customer = Customer.find_or_initialize_by(customer_company: customer_company, user_id: user_id)
    customer.save! if customer.new_record?
    contact_person = customer.contact_persons.find_or_initialize_by(department: department, position: position, name: name)
    contact_person.save! if contact_person.new_record?
    estimate = customer.estimates.create!(effective: effective, note: note, user_id: user_id, customer_id: customer.id)
    estimate.estimate_details.create(volume: volume, price: price)

  end
end
