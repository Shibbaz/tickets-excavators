class AddExcavationInfoToTicket < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :excavation_info, index: true, type: :uuid
    add_foreign_key :tickets, :excavation_infos
  end
end
