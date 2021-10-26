class CreateEstimateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :estimate_details do |t|
      t.string :volume
      t.string :price
      t.references :item, foreign_key: true
      t.references :estimate, foreign_key: true
      t.timestamps
    end
  end
end
