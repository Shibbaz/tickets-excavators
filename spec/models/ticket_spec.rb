require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context 'create method' do
    let(:ticket) {
      create(:ticket)
    }
    
    it 'passes validation' do
      expect(ticket).to be_valid
    end

    it 'expects ticket_dates type' do
      expect(TicketDates.find(ticket.ticket_dates_id)).to be_valid
    end

    it 'expects service_areas type' do
      expect(ServiceArea.find(ticket.service_areas_id)).to be_valid
    end

    it 'expects excavator type' do
      expect(Excavator.find(ticket.excavator_id)).to be_valid
    end

    it 'expects excavation_info type' do
      expect(ExcavationInfo.find(ticket.excavation_info_id)).to be_valid
    end
  end
end
