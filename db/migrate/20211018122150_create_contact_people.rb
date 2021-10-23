class CreateContactPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_people do |t|
      t.references :customer, foreign_key: true
      t.string :department
      t.string :position
      t.string :name, null: false

      t.timestamps
    end
  end
end
