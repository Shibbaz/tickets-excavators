class CreateTicketDates < ActiveRecord::Migration[7.0]
  def change
    create_table :ticket_dates do |t|
      t.datetime :request_taken_date_time, null: false
      t.datetime :transmission_date_time, null: false
      t.datetime :legal_date_time, null: false
      t.datetime :response_due_date_time, null: false
      t.datetime :restake_date, null: false
      t.datetime :expiration_date, null: false
      t.datetime :lpm_metting_accept_due_date, null: false
      t.datetime :overhead_begin_date, null: false
      t.datetime :overhead_end_date, null: false
    end
  end
end
