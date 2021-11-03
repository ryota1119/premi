class AddReferencesToEstimates < ActiveRecord::Migration[5.2]
  def change
    add_reference :estimates, :user, null: false, foreign_key: true
    add_reference :estimates, :customer, null: false, foreign_key: true
    add_reference :estimates, :contact_person, null: false, foreign_key: true
  end
end
