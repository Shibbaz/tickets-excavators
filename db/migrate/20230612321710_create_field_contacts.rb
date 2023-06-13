class CreateFieldContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :field_contacts do |t|
      t.string :name
      t.integer :phone
      t.string :email
    end
  end
end
