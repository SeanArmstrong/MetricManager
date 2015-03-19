class MethoodsController < ApplicationController
  before_action :set_methood, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @methoods = Methood.all
    respond_with(@methoods)
  end

  def show
    respond_with(@methood)
  end

  def new
    @methood = Methood.new
    respond_with(@methood)
  end

  def edit
  end

  def create
    @methood = Methood.new(methood_params)
    @methood.save
    respond_with(@methood)
  end

  def update
    @methood.update(methood_params)
    respond_with(@methood)
  end

  def destroy
    @methood.destroy
    respond_with(@methood)
  end

  private
    def set_methood
      @methood = Methood.find(params[:id])
    end

    def methood_params
      params[:methood]
    end
end
