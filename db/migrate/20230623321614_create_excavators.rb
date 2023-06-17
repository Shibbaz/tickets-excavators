class CreateExcavators < ActiveRecord::Migration[7.0]
  def change
    create_table :excavators, id: :uuid do |t|
      t.text :company_name
      t.text :address
      t.text :city
      t.text :state
      t.text :zip
      t.boolean :crew_on_site
      t.string :type
      t.references :field_contacts, foreign_key: true, type: :uuid
      t.references :contacts, foreign_key: true, type: :uuid
    end
    add_reference :tickets, :excavator, index: true, type: :uuid
    add_foreign_key :tickets, :excavators
  end
end
