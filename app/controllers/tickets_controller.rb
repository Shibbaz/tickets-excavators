class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show ]

  def index
    @tickets = Ticket.all
  end

  def create
    render :json => {
      data: JSONBuilder::Ticket.call(Trees::Ticket::Build.new(params["data"]).call)
      }
  rescue => e
    render :json => {
      error: "Please check your params",
      status: 400
    }
  end

  def show
    respond_to do |format|
      format.html { 
        render :show
      }
      format.json { 
        render :json => { data: JSONBuilder::Ticket.call(@ticket) } 
      }
    end
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
      @digsite_info = @ticket.excavation_info.digsite_info
      @adress_info = AdressInfo.find(@digsite_info.adress_info_id)
      @polygon = @digsite_info.polygon.coordinates.first

    rescue => e
      render :json => {
        error: "Records Not Found",
        status: 404
      }
    end
end

