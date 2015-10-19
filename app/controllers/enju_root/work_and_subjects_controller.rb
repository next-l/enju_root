require_dependency "enju_root/application_controller"

module EnjuRoot
  class WorkAndSubjectsController < ApplicationController
    before_action :set_work_and_subject, only: [:show, :edit, :update, :destroy]

    # GET /work_and_subjects
    def index
      @work_and_subjects = WorkAndSubject.all
    end

    # GET /work_and_subjects/1
    def show
    end

    # GET /work_and_subjects/new
    def new
      @work_and_subject = WorkAndSubject.new
    end

    # GET /work_and_subjects/1/edit
    def edit
    end

    # POST /work_and_subjects
    def create
      @work_and_subject = WorkAndSubject.new(work_and_subject_params)

      if @work_and_subject.save
        redirect_to @work_and_subject, notice: 'Work and subject was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /work_and_subjects/1
    def update
      if @work_and_subject.update(work_and_subject_params)
        redirect_to @work_and_subject, notice: 'Work and subject was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /work_and_subjects/1
    def destroy
      @work_and_subject.destroy
      redirect_to work_and_subjects_url, notice: 'Work and subject was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_work_and_subject
        @work_and_subject = WorkAndSubject.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def work_and_subject_params
        params.require(:work_and_subject).permit(:source_url, :destination_url, :relationship_type_id, :note)
      end
  end
end
