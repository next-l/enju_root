require_dependency "enju_root/application_controller"

module EnjuRoot
  class WorksController < ApplicationController
    before_action :set_work, only: [:show, :edit, :update, :destroy]

    # GET /works
    def index
      @parent = Work.find(params[:parent_id]) if params[:parent_id]
      @expression = Expression.find(params[:expression_id]) if params[:expression_id]
      #if @expression
      #  @reify = Reify.where(:expression_id => @expression.id, :work_id => @expression.work.id).first
      #end
      #@manifestation_id = Manifestation.find(params[:manifestation_id]).id if params[:manifestation_id]
      #if params[:manifestation_url].present?
      #  if Manifestation.where(url: params[:manifestation_url]).first
      #    flash[:notice] = 'This manifestation URL is already registered.'
      #  end
      #end
      @query = params[:query]
      @works = Work.search do
        adjust_solr_params do |params|
          params[:defType] = 'edismax'
        end
        #if params[:mode] != 'add'
        #  with(:creator_ids).equal_to agent.id if agent
        #end
        fulltext params[:query]
        paginate page: params[:page], per_page: 10
      end.results
    end

    # GET /works/1
    def show
      respond_to do |format|
        format.html
        format.json
        format.svg {
          send_file "#{Rails.root.to_s}/public/work_#{@work.id}.svg", :disposition => "inline", type: "image/svg+xml"
        }
        format.jsonld
      end
    end

    # GET /works/new
    def new
      @work = Work.new
    end

    # GET /works/1/edit
    def edit
    end

    # POST /works
    def create
      @work = Work.new(work_params)

      if @work.save
        redirect_to @work, notice: 'Work was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /works/1
    def update
      if @work.update(work_params)
        redirect_to @work, notice: 'Work was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /works/1
    def destroy
      @work.destroy
      redirect_to works_url, notice: 'Work was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_work
        @work = Work.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def work_params
        params[:work].permit(:preferred_title)
      end
  end
end
