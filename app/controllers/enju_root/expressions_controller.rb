require_dependency "enju_root/application_controller"

module EnjuRoot
  class ExpressionsController < ApplicationController
    before_action :set_expression, only: [:show, :edit, :update, :destroy]

    # GET /expressions
    def index
      @expressions = Expression.all
    end

    # GET /expressions/1
    def show
    end

    # GET /expressions/new
    def new
      @expression = Expression.new
      @expression.work = Work.where(id: params[:work_id]).first
      prepare_options
    end

    # GET /expressions/1/edit
    def edit
      prepare_options
    end

    # POST /expressions
    def create
      @expression = Expression.new(expression_params)

      if @expression.save
        redirect_to @expression, notice: 'Expression was successfully created.'
      else
        prepare_options
        render :new
      end
    end

    # PATCH/PUT /expressions/1
    def update
      if @expression.update(expression_params)
        redirect_to @expression, notice: 'Expression was successfully updated.'
      else
        prepare_options
        render :edit
      end
    end

    # DELETE /expressions/1
    def destroy
      @expression.destroy
      redirect_to expressions_url, notice: 'Expression was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_expression
        @expression = Expression.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def expression_params
        params[:expression].permit(:work_id, :language_id, :content_type_id)
      end

      def prepare_options
        @content_types = ContentType.order(:position)
        @languages = Language.order(:position)
      end
  end
end
