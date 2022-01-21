class EstimateForm
  include ActiveModel::Model
  # include ActiveModel::Attributes

  attr_accessor :company_name, :department, :position, :name, :effective, :note, :item_name, :volume, :price, :item_id, :user_id, :customer_id, :contact_person_id
  
  validates :company_name, :name, presence: true
  validates :volume, :price, presence: true

  delegate :persisted?, to: :estimate

  def initialize(attributes = nil, estimate: Estimate.new)
    @estimate = estimate
    attributes ||= default_attributes
    super(attributes)
  end


  def save
    return if invalid?

    ActiveRecord::Base.transaction do
      customer = Customer.find_or_initialize_by(company_name: company_name, user_id: user_id)
      contact_person = customer.contact_persons.find_or_initialize_by(name: name, customer_id: customer.id)
      customer.save!

      item = Item.find_or_initialize_by(item_name: item_name, user_id: user_id )
      item.save!

      # items = split_items.map{|values| Item.find_or_create_by!(item_name: values.item_name, volume: values.volume, price: values.price, note: values.note)}

      estimate = Estimate.new(effective: effective, note: note, user_id: user_id, customer_id: customer.id, contact_person_id: contact_person.id)
      estimate_details = estimate.estimate_details.new(volume: volume, price: price, item_id: item.id, estimate_id: estimate.id)
      estimate.save!
    end
    rescue ActiveRecord::RecordInvalid
      false
  end

  private

  attr_reader :estimate

  def default_attributes
    # {
    #   company_name: estimate.company_name
    #   ・
    #   ・
    #   ・
    # }
  end

  def split_item
    items.split(',')
  end

end
