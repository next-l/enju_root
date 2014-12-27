class ClassificationsController < ApplicationController
  before_action :set_classification, only: [:show, :edit, :update, :destroy]

  # GET /classifications
  # GET /classifications.json
  def index
    query = @query = params[:q]
    @classifications = Classification.search do
      fulltext query
      order_by :node
      with(:parent_id).equal_to nil
      paginate :page => params[:page]
#      with(:work_url).equal_to params[:work_url] if params[:work_url]
    end.results
  end

  # GET /classifications/1
  # GET /classifications/1.json
  def show
    respond_to do |format|
    format.html
    format.xml
    format.json
    end
  end

  # GET /classifications/new
  def new
    @classification = Classification.new
    @classification.parent_id = params[:parent_id]
  end

  # GET /classifications/1/edit
  def edit
    @classification.new_parent = Classification.find(params[:new_parent_id]) if params[:new_parent_id]
  end

  # POST /classifications
  # POST /classifications.json
  def create
    @classification = Classification.new(classification_params)

    respond_to do |format|
      if @classification.save
        format.html { redirect_to @classification, notice: 'Classification was successfully created.' }
        format.json { render action: 'show', status: :created, location: @classification }
      else
        format.html { render action: 'new' }
        format.json { render json: @classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classifications/1
  # PATCH/PUT /classifications/1.json
  def update
    if @classification.try(:new_parent_id)
      @classification.parent = Classification.find(@classification.new_parent_id)
    end

    respond_to do |format|
      if @classification.update(classification_params)
        format.html { redirect_to @classification, notice: 'Classification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classifications/1
  # DELETE /classifications/1.json
  def destroy
    @classification.destroy
    respond_to do |format|
      format.html { redirect_to classifications_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classification
      if params[:category]
        @classification = Classification.where(:category => params[:category]).first
      else
        @classification = Classification.friendly.find(params[:id])
      end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classification_params
      params.require(:classification).permit(:node, :term, :category, :parent_id, :new_parent_id, :parent_url, :child_url)
    end
end
