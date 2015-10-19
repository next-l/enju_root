require_dependency "enju_root/application_controller"

module EnjuRoot
  class WorkRelationshipTypesController < ApplicationController
    before_action :set_work_relationship_type, only: [:show, :edit, :update, :destroy]

    # GET /work_relationship_types
    def index
      @work_relationship_types = WorkRelationshipType.all
    end

    # GET /work_relationship_types/1
    def show
    end

    # GET /work_relationship_types/new
    def new
      @work_relationship_type = WorkRelationshipType.new
    end

    # GET /work_relationship_types/1/edit
    def edit
    end

    # POST /work_relationship_types
    def create
      @work_relationship_type = WorkRelationshipType.new(work_relationship_type_params)

      if @work_relationship_type.save
        redirect_to @work_relationship_type, notice: 'Work relationship type was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /work_relationship_types/1
    def update
      if @work_relationship_type.update(work_relationship_type_params)
        redirect_to @work_relationship_type, notice: 'Work relationship type was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /work_relationship_types/1
    def destroy
      @work_relationship_type.destroy
      redirect_to work_relationship_types_url, notice: 'Work relationship type was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_work_relationship_type
        @work_relationship_type = WorkRelationshipType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def work_relationship_type_params
        params.require(:work_relationship_type).permit(:name, :display_name, :note, :position)
      end
  end
end
