class WorkAndThemataController < ApplicationController
  before_action :set_work_and_thema, only: [:show, :edit, :update, :destroy]

  # GET /work_and_themata
  # GET /work_and_themata.json
  def index
    @work_and_themata = WorkAndThema.all
  end

  # GET /work_and_themata/1
  # GET /work_and_themata/1.json
  def show
  end

  # GET /work_and_themata/new
  def new
    @work_and_thema = WorkAndThema.new
    @thema = Thema.find(params[:thema_id])
    @work_and_thema.thema = @thema
  end

  # GET /work_and_themata/1/edit
  def edit
  end

  # POST /work_and_themata
  # POST /work_and_themata.json
  def create
    @work_and_thema = WorkAndThema.new(work_and_thema_params)

    respond_to do |format|
      if @work_and_thema.save
        format.html { redirect_to @work_and_thema, notice: 'Work and thema was successfully created.' }
        format.json { render action: 'show', status: :created, location: @work_and_thema }
      else
        format.html { render action: 'new' }
        format.json { render json: @work_and_thema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_and_themata/1
  # PATCH/PUT /work_and_themata/1.json
  def update
    respond_to do |format|
      if @work_and_thema.update(work_and_thema_params)
        format.html { redirect_to @work_and_thema, notice: 'Work and thema was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @work_and_thema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_and_themata/1
  # DELETE /work_and_themata/1.json
  def destroy
    @work_and_thema.destroy
    respond_to do |format|
      format.html { redirect_to work_and_themata_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_and_thema
      @work_and_thema = WorkAndThema.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_and_thema_params
      params.require(:work_and_thema).permit(:work_id, :thema_id)
    end
end
