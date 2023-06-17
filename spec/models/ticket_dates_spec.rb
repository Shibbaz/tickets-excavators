require "rails_helper"

RSpec.describe TicketDates, type: :model do
  context "create method" do
    let(:ticket_dates) {
      create(:ticket_dates)
    }
    it "passes validation" do
      expect(ticket_dates).to be_valid
    end

    it "expects presence of response_due_date_time attribute" do
      expect(ticket_dates[:response_due_date_time].class).to be(ActiveSupport::TimeWithZone)
    end

    it "expects presence of transmission_date_time attribute" do
      expect(ticket_dates[:transmission_date_time].class).to be(ActiveSupport::TimeWithZone)
    end

    it "expects presence of legal_date_time attribute" do
      expect(ticket_dates[:legal_date_time].class).to be(ActiveSupport::TimeWithZone)
    end

    it "expects presence of request_taken_date_time attribute" do
      expect(ticket_dates[:request_taken_date_time].class).to be(ActiveSupport::TimeWithZone)
    end

    it "expects presence of expiration_date attribute" do
      expect(ticket_dates[:expiration_date].class).to be(ActiveSupport::TimeWithZone)
    end

    it "expects presence of lpm_metting_accept_due_date attribute" do
      expect(ticket_dates[:lpm_metting_accept_due_date].class).to be(ActiveSupport::TimeWithZone)
    end

    it "expects presence of overhead_begin_date attribute" do
      expect(ticket_dates[:overhead_begin_date].class).to be(ActiveSupport::TimeWithZone)
    end

    it "expects presence of overhead_end_date attribute" do
      expect(ticket_dates[:overhead_end_date].class).to be(ActiveSupport::TimeWithZone)
    end
  end
end
