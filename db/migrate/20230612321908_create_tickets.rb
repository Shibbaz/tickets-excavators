class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.text :requestNumber
      t.integer :versionNumber
      t.integer :sequenceNumber
      t.text :requestType
      t.text :requestAction
      t.references :service_areas, foreign_key: true
      t.references :ticket_dates, foreign_key: true
    end
  end
end
