class MethoodsController < ApplicationController
  before_action :set_methood, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @methoods = current_user.projects.find_by_id(params[:pid]).klasses.find_by_id(params[:kid]).methoods
    respond_with(@methoods)
  end

  def show
    if @methood.present?
      respond_with(@methood)
    else
      redirect_to root_path
    end
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
      @methood = current_user.projects.find_by_id(params[:pid]).klasses.find_by_id(params[:kid]).methoods.find_by_id(params[:mid])
    end

    def methood_params
      params[:methood]
    end
end
