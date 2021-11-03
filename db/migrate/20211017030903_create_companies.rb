class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name,         null: false, default: ""
      t.string :tel,                  null: false, default: ""
      t.string :fax,                  null: false, default: ""
      t.string :postal_code,          null: false, default: ""
      t.string :address,              null: false, default: ""
      t.references :user,             index: true
      t.timestamps
    end
  end
end
