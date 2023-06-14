class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show ]

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
  end

  def create
    Trees::Ticket::Build.new(params[:data]).call
  end

  def show
    render :json => {
      RequestType: @ticket.request_type,
      RequestNumber: @ticket.request_number,
      VersionNumber: @ticket.version_number,
      RequestNumber: @ticket.request_number,
      RequestAction: @ticket.request_action,
      DateTimes: @ticket.ticket_dates,
      ServiceArea: ::Contexts::ServiceAreas::Repository.new.load(@ticket.service_areas_id),
      Excavator: ::Contexts::Excavators::Repository.new.load(@ticket.excavator_id),
      ExcavationInfo: ::Contexts::ExcavationDatas::Repository.new.load(@ticket.excavation_info_id)
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.permit(:data)
    end
end
