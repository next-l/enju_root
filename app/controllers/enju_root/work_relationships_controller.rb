require_dependency "enju_root/application_controller"

module EnjuRoot
  class WorkRelationshipsController < ApplicationController
    before_action :set_work_relationship, only: [:show, :edit, :update, :destroy]

    # GET /work_relationships
    def index
      @work_relationships = WorkRelationship.all
    end

    # GET /work_relationships/1
    def show
    end

    # GET /work_relationships/new
    def new
      @work_relationship = WorkRelationship.new
      @work_relationship.parent = Work.find(params[:parent_id]) if params[:parent_id]
      @work_relationship.child = Work.find(params[:child_id]) if params[:child_id]
    end

    # GET /work_relationships/1/edit
    def edit
    end

    # POST /work_relationships
    def create
      @work_relationship = WorkRelationship.new(work_relationship_params)

      if @work_relationship.save
        redirect_to @work_relationship, notice: 'Work relationship was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /work_relationships/1
    def update
      if @work_relationship.update(work_relationship_params)
        redirect_to @work_relationship, notice: 'Work relationship was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /work_relationships/1
    def destroy
      @work_relationship.destroy
      redirect_to work_relationships_url, notice: 'Work relationship was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_work_relationship
        @work_relationship = WorkRelationship.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def work_relationship_params
        params.require(:work_relationship).permit(:parent_id, :child_id, :work_relationship_type_id, :note)
      end
  end
end
