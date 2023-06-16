class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets, id: :uuid do |t|
      t.text :contact_center
      t.text :request_number
      t.integer :version_number
      t.integer :sequence_number
      t.text :request_type
      t.text :request_action
      t.references :service_areas, foreign_key: true, type: :uuid
      t.references :ticket_dates, foreign_key: true, type: :uuid
    end
  end
end
