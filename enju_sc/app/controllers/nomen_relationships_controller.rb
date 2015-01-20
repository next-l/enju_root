class NomenRelationshipsController < ApplicationController
  before_action :set_nomen_relationship, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @nomen_relationships = NomenRelationship.all
    respond_with(@nomen_relationships)
  end

  def show
    respond_with(@nomen_relationship)
  end

  def new
    @nomen_relationship = NomenRelationship.new
    respond_with(@nomen_relationship)
  end

  def edit
  end

  def create
    @nomen_relationship = NomenRelationship.new(nomen_relationship_params)
    @nomen_relationship.save
    respond_with(@nomen_relationship)
  end

  def update
    @nomen_relationship.update(nomen_relationship_params)
    respond_with(@nomen_relationship)
  end

  def destroy
    @nomen_relationship.destroy
    respond_with(@nomen_relationship)
  end

  private
    def set_nomen_relationship
      @nomen_relationship = NomenRelationship.find(params[:id])
    end

    def nomen_relationship_params
      params.require(:nomen_relationship).permit(:parent_id, :child_id, :nomen_relationship_id, :position)
    end
end
