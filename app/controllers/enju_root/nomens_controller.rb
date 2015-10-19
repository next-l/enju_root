require_dependency "enju_root/application_controller"

module EnjuRoot
  class NomensController < ApplicationController
    before_action :set_nomen, only: [:show, :edit, :update, :destroy]

    # GET /nomen
    def index
      @nomens = Nomen.all
    end

    # GET /nomen/1
    def show
    end

    # GET /nomen/new
    def new
      @nomen = Nomen.new
    end

    # GET /nomen/1/edit
    def edit
    end

    # POST /nomen
    def create
      @nomen = Nomen.new(nomen_params)

      if @nomen.save
        redirect_to @nomen, notice: 'Nomen was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /nomen/1
    def update
      if @nomen.update(nomen_params)
        redirect_to @nomen, notice: 'Nomen was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /nomen/1
    def destroy
      @nomen.destroy
      redirect_to nomen_url, notice: 'Nomen was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_nomen
        @nomen = Nomen.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def nomen_params
        params[:nomen]
      end
  end
end
