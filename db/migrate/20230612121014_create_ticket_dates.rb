class CreateTicketDates < ActiveRecord::Migration[7.0]
  def change
    create_table :ticket_dates do |t|
      t.datetime :requestTakenDateTime, null: false
      t.datetime :transmissionDateTime, null: false
      t.datetime :legalDateTime, null: false
      t.datetime :responseDueDateTime, null: false
      t.datetime :restakeDate, null: false
      t.datetime :expirationDate, null: false
      t.datetime :lpmMettingAcceptDueDate, null: false
      t.datetime :overheadBeginDate, null: false
      t.datetime :overheadEndDate, null: false
    end
  end
end
