class CreateEstimates < ActiveRecord::Migration[5.2]
  def change
    create_table :estimates do |t|
      t.date :effective
      t.text :note
      t.timestamps
    end
  end
end
