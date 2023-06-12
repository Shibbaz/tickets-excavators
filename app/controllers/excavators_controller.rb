class ExcavatorsController < ApplicationController
  before_action :set_excavator, only: %i[ show edit update destroy ]

  # GET /excavators or /excavators.json
  def index
    @excavators = Excavator.all
  end

  # GET /excavators/1 or /excavators/1.json
  def show
  end

  # GET /excavators/new
  def new
    @excavator = Excavator.new
  end

  # GET /excavators/1/edit
  def edit
  end

  # POST /excavators or /excavators.json
  def create
    @excavator = Excavator.new(excavator_params)

    respond_to do |format|
      if @excavator.save
        format.html { redirect_to excavator_url(@excavator), notice: "Excavator was successfully created." }
        format.json { render :show, status: :created, location: @excavator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @excavator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /excavators/1 or /excavators/1.json
  def update
    respond_to do |format|
      if @excavator.update(excavator_params)
        format.html { redirect_to excavator_url(@excavator), notice: "Excavator was successfully updated." }
        format.json { render :show, status: :ok, location: @excavator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @excavator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /excavators/1 or /excavators/1.json
  def destroy
    @excavator.destroy

    respond_to do |format|
      format.html { redirect_to excavators_url, notice: "Excavator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_excavator
      @excavator = Excavator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def excavator_params
      params.require(:excavator).permit(:companyName)
    end
end
