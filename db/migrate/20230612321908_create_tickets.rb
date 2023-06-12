class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.text :request_number
      t.integer :version_number
      t.integer :sequence_number
      t.text :request_type
      t.text :request_action
      t.references :service_areas, foreign_key: true
      t.references :ticket_dates, foreign_key: true
    end
  end
end
