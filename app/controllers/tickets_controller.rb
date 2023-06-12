class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show ]

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
  end

  def show
    render :json => {
      RequestType: @ticket.request_type,
      RequestNumber: @ticket.request_number,
      VersionNumber: @ticket.version_number,
      RequestNumber: @ticket.request_number,
      RequestAction: @ticket.request_action,
      DateTimes: @ticket.ticket_dates,
      ServiceArea: @ticket.service_areas
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
end
