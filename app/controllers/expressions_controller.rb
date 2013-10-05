class ExpressionsController < ApplicationController
  before_filter :prepare_options, :only => [:new, :edit]

  # GET /expressions
  # GET /expressions.json
  def index
    @work = work = Work.find(params[:work_id]) if params[:work_id]
    @parent_expression = Expression.find(params[:parent_id]) if params[:parent_id]
    @manifestation = manifestation = Manifestation.find(params[:manifestation_id]) if params[:manifestation_id]
    @agent = agent = Agent.find(params[:agent_id]) if params[:agent_id]
    @expressions = Expression.search do
      if params[:mode] != 'add'
        with(:work_id).equal_to work.id if work
        with(:manifestation_ids).equal_to manifestation.id if manifestation
        with(:agent_ids).equal_to agent.id if agent
      end
      fulltext params[:query]
      paginate :page => params[:page], :per_page => Expression.default_per_page
    end.results

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expressions }
    end
  end

  # GET /expressions/1
  # GET /expressions/1.json
  def show
    @expression = Expression.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json #{ render json: @expression }
      format.jsonld
    end
  end

  # GET /expressions/new
  # GET /expressions/new.json
  def new
    @expression = Expression.new
    @expression.manifestation_url = params[:manifestation_url]
    @work = Work.find(params[:work_id]) if params[:work_id]
    unless @work
      flash[:notice] = "You should specify the Work entity."
      redirect_to works_url; return
    end
    if @expression.manifestation_url
      @manifestation = Manifestation.where(:url => params[:manifestation_url]).first
    elsif params[:manifestation_id]
      @manifestation = Manifestation.find(params[:manifestation_id])
    end
    @expression.work = @work
    @expression.work_id = @work.id
    @expression.preferred_title = @expression.work.preferred_title
    @expression.manifestation_id = @manifestation.id if @manifestation

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expression }
    end
  end

  # GET /expressions/1/edit
  def edit
    @expression = Expression.find(params[:id])
  end

  # POST /expressions
  # POST /expressions.json
  def create
    @expression = Expression.new(params[:expression])

    respond_to do |format|
      work = Work.find(@expression.work_id)
      @expression.work = work
      if @expression.save
        #if @expression.manifestation_id.present?
        #  format.html { redirect_to new_embody_url(:expression_id => @expression.id, :manifestation_id => @expression.manifestation_id), notice: 'Expression was successfully created.' }
        #else
          if @expression.manifestation_url.present?
            manifestation = Manifestation.where(:url => @expression.manifestation_url).first
            manifestation = Manifestation.create(:url => @expression.manifestation_url) unless manifestation
            manifestation.expressions << @expression
            format.html { redirect_to manifestation, :notice => 'Expression was successfully created.' }
          else
            format.html { redirect_to @expression, :notice => 'Expression was successfully created.' }
          end
        #end
        format.json { render json: @expression, status: :created, location: @expression }
      else
        prepare_options
        format.html { render action: "new" }
        format.json { render json: @expression.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expressions/1
  # PUT /expressions/1.json
  def update
    @expression = Expression.find(params[:id])

    respond_to do |format|
      if @expression.update_attributes(params[:expression])
        format.html { redirect_to @expression, notice: 'Expression was successfully updated.' }
        format.json { head :no_content }
      else
        prepare_options
        format.html { render action: "edit" }
        format.json { render json: @expression.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expressions/1
  # DELETE /expressions/1.json
  def destroy
    @expression = Expression.find(params[:id])
    @expression.destroy

    respond_to do |format|
      format.html { redirect_to expressions_url }
      format.json { head :no_content }
    end
  end

  private
  def prepare_options
    @content_types = ContentType.all
  end
end
