class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts, id: :uuid do |t|
      t.string :name
      t.integer :phone
      t.string :email
    end
  end
end
