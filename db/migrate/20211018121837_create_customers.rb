class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :customer_company, null: false

      t.timestamps
    end
  end
end
