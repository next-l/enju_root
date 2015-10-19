require_dependency "enju_root/application_controller"

module EnjuRoot
  class ManifestationsController < ApplicationController
    before_action :set_manifestation, only: [:show, :edit, :update, :destroy]

    # GET /manifestations
    def index
      @manifestations = Manifestation.all
    end

    # GET /manifestations/1
    def show
    end

    # GET /manifestations/new
    def new
      @manifestation = Manifestation.new
    end

    # GET /manifestations/1/edit
    def edit
    end

    # POST /manifestations
    def create
      @manifestation = Manifestation.new(manifestation_params)

      if @manifestation.save
        redirect_to @manifestation, notice: 'Manifestation was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /manifestations/1
    def update
      if @manifestation.update(manifestation_params)
        redirect_to @manifestation, notice: 'Manifestation was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /manifestations/1
    def destroy
      @manifestation.destroy
      redirect_to manifestations_url, notice: 'Manifestation was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_manifestation
        @manifestation = Manifestation.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def manifestation_params
        params.require(:manifestation).permit(:manifestation_url)
      end
  end
end
