class ChangeContactPeapleToContactPerson < ActiveRecord::Migration[5.2]
  def change
    rename_table :contact_people, :contact_person
  end
end
