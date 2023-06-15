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
      error: "Not Enough Params, Please check your params",
      status: 400
    }
  end

  def show
    render :json => {
      data: JSONBuilder::Ticket.call(@ticket)
    }
  rescue => e
    render :json => {
      error: "Not Found",
      status: 404
    }
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
end

