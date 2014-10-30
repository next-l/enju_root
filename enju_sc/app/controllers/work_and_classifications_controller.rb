class WorkAndClassificationsController < ApplicationController
  before_action :set_work_and_classification, only: [:show, :edit, :update, :destroy]

  # GET /work_and_classifications
  # GET /work_and_classifications.json
  def index
    @work_and_classifications = WorkAndClassification.all
  end

  # GET /work_and_classifications/1
  # GET /work_and_classifications/1.json
  def show
  end

  # GET /work_and_classifications/new
  def new
    @work_and_classification = WorkAndClassification.new
    @classification = Classification.find(params[:classification_id])
    @work_and_classification.classification = @classification
  end

  # GET /work_and_classifications/1/edit
  def edit
  end

  # POST /work_and_classifications
  # POST /work_and_classifications.json
  def create
    @work_and_classification = WorkAndClassification.new(work_and_classification_params)

    respond_to do |format|
      if @work_and_classification.save
        format.html { redirect_to @work_and_classification, notice: 'Work and classification was successfully created.' }
        format.json { render action: 'show', status: :created, location: @work_and_classification }
      else
        format.html { render action: 'new' }
        format.json { render json: @work_and_classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_and_classifications/1
  # PATCH/PUT /work_and_classifications/1.json
  def update
    respond_to do |format|
      if @work_and_classification.update(work_and_classification_params)
        format.html { redirect_to @work_and_classification, notice: 'Work and classification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @work_and_classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_and_classifications/1
  # DELETE /work_and_classifications/1.json
  def destroy
    @work_and_classification.destroy
    respond_to do |format|
      format.html { redirect_to work_and_classifications_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_and_classification
      @work_and_classification = WorkAndClassification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_and_classification_params
      params.require(:work_and_classification).permit(:work_id, :classification_id)
    end
end
