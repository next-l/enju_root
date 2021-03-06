require_dependency "enju_root/application_controller"

module EnjuRoot
  class EmbodiesController < ApplicationController
    before_action :set_embody, only: [:show, :edit, :update, :destroy]

    # GET /embodies
    def index
      @embodies = Embody.all
    end

    # GET /embodies/1
    def show
    end

    # GET /embodies/new
    def new
      @embody = Embody.new
      @embody.expression = Expression.find(params[:expression_id]) if params[:expression_id]
      @embody.manifestation_url = params[:manifestation_url]
    end

    # GET /embodies/1/edit
    def edit
    end

    # POST /embodies
    def create
      @embody = Embody.new(embody_params)
      @embody.manifestation = Manifestation.where(manifestation_url: @embody.manifestation_url).first_or_create

      if @embody.save
        redirect_to @embody, notice: 'Embody was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /embodies/1
    def update
      if @embody.update(embody_params)
        @embody.manifestation = Manifestation.where(manifestation_url: @embody.manifestation_url).first_or_create
        @embody.save
        redirect_to @embody, notice: 'Embody was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /embodies/1
    def destroy
      @embody.destroy
      redirect_to embodies_url, notice: 'Embody was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_embody
        @embody = Embody.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def embody_params
        params.require(:embody).permit(
          :expression_id, :manifestation_id, :embody_type_id, :note,
          :manifestation_url
        )
      end
  end
end
