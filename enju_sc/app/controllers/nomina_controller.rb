class NominaController < ApplicationController
  before_action :set_nomen, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @nomina = Nomen.page(params[:page])
    respond_with(@nomina)
  end

  def show
    respond_with(@nomen)
  end

  def new
    @nomen = Nomen.new
    respond_with(@nomen)
  end

  def edit
  end

  def create
    @nomen = Nomen.new(nomen_params)
    @nomen.save
    respond_with(@nomen)
  end

  def update
    @nomen.update(nomen_params)
    respond_with(@nomen)
  end

  def destroy
    @nomen.destroy
    respond_with(@nomen)
  end

  private
    def set_nomen
      @nomen = Nomen.find(params[:id])
    end

    def nomen_params
      params.require(:nomen).permit(:name)
    end
end
