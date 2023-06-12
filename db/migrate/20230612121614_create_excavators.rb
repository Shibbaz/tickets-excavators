class CreateExcavators < ActiveRecord::Migration[7.0]
  def change
    create_table :excavators do |t|
      t.text :companyName
      t.text :address
      t.boolean :crewOnsite
    end
  end
end
