class EstimateForm
  include ActiveModel::Model
  # include ActiveModel::Attributes

  attr_accessor :company_name, :department, :position, :name, :effective, :note, :item_id, :user_id, :customer_id, :contact_person_id, :estimate_id, :items
  
  validates :company_name, :name, presence: true
  # validates :item_name, :volume, :price, presence: true

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
      contact_person = customer.contact_persons.find_or_initialize_by(department: department, position: position, name: name, customer_id: customer.id)
      customer.save!
      
      estimate = Estimate.new(effective: effective, note: note, user_id: user_id, customer_id: customer.id, contact_person_id: contact_person.id)
      estimate.save!
      
      item_details = items.keys.sort.map{ |index| items[index] }
      item_details.each do |item|
        saveItem = Item.find_or_initialize_by(item_name: item["item_name"], user_id: user_id )
        saveItem.save!
        estimate_detail = estimate.estimate_details.new(volume: item["volume"], price: item["price"], item_id: saveItem.id, estimate_id: estimate.id)
        estimate_detail.save!
      end
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
