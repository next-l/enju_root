require_dependency "enju_root/application_controller"

module EnjuRoot
  class ThemasController < ApplicationController
    before_action :set_thema, only: [:show, :edit, :update, :destroy]

    # GET /themas
    def index
      @themas = Thema.all
    end

    # GET /themas/1
    def show
    end

    # GET /themas/new
    def new
      @thema = Thema.new
    end

    # GET /themas/1/edit
    def edit
    end

    # POST /themas
    def create
      @thema = Thema.new(thema_params)

      if @thema.save
        redirect_to @thema, notice: 'Thema was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /themas/1
    def update
      if @thema.update(thema_params)
        redirect_to @thema, notice: 'Thema was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /themas/1
    def destroy
      @thema.destroy
      redirect_to themas_url, notice: 'Thema was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_thema
        @thema = Thema.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def thema_params
        params[:thema]
      end
  end
end
