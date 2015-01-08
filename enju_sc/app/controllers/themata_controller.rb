class ThemataController < ApplicationController
  before_action :set_thema, only: [:show, :edit, :update, :destroy]

  # GET /themata
  # GET /themata.json
  def index
    @query = params[:q]
    @query = '*:*' if @query.blank?
    query = Jbuilder.encode do |json|
      json.filter do
        json.missing do
          json.field "parent_id"
        end
      end
      json.query do
        json.query_string do
          json.query @query
        end
      end
      json.sort do
        json.node "asc"
      end
    end
    @themata = Thema.__elasticsearch__.search(query).page(params[:page]).records
  end

  # GET /themata/1
  # GET /themata/1.json
  def show
    respond_to do |format|
    format.html
    format.xml
    format.json
    end
  end

  # GET /themata/new
  def new
    @thema = Thema.new
    @thema.parent_url = params[:parent_url]
  end

  # GET /themata/1/edit
  def edit
    @thema.new_parent = Thema.find(params[:new_parent_id]) if params[:new_parent_id]
  end

  # POST /themata
  # POST /themata.json
  def create
    @thema = Thema.new(thema_params)

    respond_to do |format|
      if @thema.save
        format.html { redirect_to @thema, notice: 'Thema was successfully created.' }
        format.json { render action: 'show', status: :created, location: @thema }
      else
        format.html { render action: 'new' }
        format.json { render json: @thema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /themata/1
  # PATCH/PUT /themata/1.json
  def update
    if @thema.try(:new_parent_id)
      @thema.parent = Thema.find(@thema.new_parent_id)
    end

    respond_to do |format|
      if @thema.update(thema_params)
        format.html { redirect_to @thema, notice: 'Thema was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @thema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /themata/1
  # DELETE /themata/1.json
  def destroy
    @thema.destroy
    respond_to do |format|
      format.html { redirect_to themata_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thema
      if params[:category]
        @thema = Thema.where(:category => params[:category]).first
      else
        @thema = Thema.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thema_params
      params.require(:thema).permit(:node, :term, :category, :parent_id, :new_parent_id)
    end
end
