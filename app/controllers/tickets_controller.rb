class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show ]

  def index
    @tickets = Ticket.all
  end

  def create
    @ticket = Trees::Ticket::Build.new(params["data"]).call
    render :json => {
      data: build_json(@ticket)
      }
  rescue => e
    render :json => {
      error: "Not Enough Params, Please check your params",
      status: 400
    }
  end

  def show
    render :json => {
      data: build_json(@ticket)
    }
  rescue => e
    render :json => {
      error: "Not Found",
      status: 404
    }
  end

  private

    def build_json(ticket)
      {
        RequestType: ticket.request_type,
        RequestNumber: ticket.request_number,
        VersionNumber: ticket.version_number,
        RequestNumber: ticket.request_number,
        RequestAction: ticket.request_action,
        DateTimes: ticket.ticket_dates,
        ServiceArea: ::Contexts::ServiceAreas::Repository.new.load(ticket.service_areas_id),
        Excavator: ::Contexts::Excavators::Repository.new.load(ticket.excavator_id),
        ExcavationInfo: ::Contexts::ExcavationDatas::Repository.new.load(ticket.excavation_info_id)
      }
    end

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
end

