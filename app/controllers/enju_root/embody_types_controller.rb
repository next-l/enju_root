require_dependency "enju_root/application_controller"

module EnjuRoot
  class EmbodyTypesController < ApplicationController
    before_action :set_embody_type, only: [:show, :edit, :update, :destroy]

    # GET /embody_types
    def index
      @embody_types = EmbodyType.all
    end

    # GET /embody_types/1
    def show
    end

    # GET /embody_types/new
    def new
      @embody_type = EmbodyType.new
    end

    # GET /embody_types/1/edit
    def edit
    end

    # POST /embody_types
    def create
      @embody_type = EmbodyType.new(embody_type_params)

      if @embody_type.save
        redirect_to @embody_type, notice: 'Embody type was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /embody_types/1
    def update
      if @embody_type.update(embody_type_params)
        redirect_to @embody_type, notice: 'Embody type was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /embody_types/1
    def destroy
      @embody_type.destroy
      redirect_to embody_types_url, notice: 'Embody type was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_embody_type
        @embody_type = EmbodyType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def embody_type_params
        params.require(:embody_type).permit(:name, :display_name, :note, :position)
      end
  end
end
