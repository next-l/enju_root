require_dependency "enju_root/application_controller"

module EnjuRoot
  class FormOfWorksController < ApplicationController
    before_action :set_form_of_work, only: [:show, :edit, :update, :destroy]

    # GET /form_of_works
    def index
      @form_of_works = FormOfWork.all
    end

    # GET /form_of_works/1
    def show
    end

    # GET /form_of_works/new
    def new
      @form_of_work = FormOfWork.new
    end

    # GET /form_of_works/1/edit
    def edit
    end

    # POST /form_of_works
    def create
      @form_of_work = FormOfWork.new(form_of_work_params)

      if @form_of_work.save
        redirect_to @form_of_work, notice: 'FormOfWork was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /form_of_works/1
    def update
      if @form_of_work.update(form_of_work_params)
        redirect_to @form_of_work, notice: 'FormOfWork was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /form_of_works/1
    def destroy
      @form_of_work.destroy
      redirect_to form_of_works_url, notice: 'FormOfWork was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_form_of_work
        @form_of_work = FormOfWork.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def form_of_work_params
        params.require(:form_of_work).permit(:name, :display_name, :note, :position)
      end
  end
end
