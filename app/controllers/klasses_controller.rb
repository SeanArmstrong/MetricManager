class KlassesController < ApplicationController
  before_action :set_klass, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @klasses = current_user.projects.find_by_id(params[:pid]).klasses
    respond_with(@klasses)
  end

  def show
    if @klass.present?
      respond_with(@klass)
    end
  end

  def new
    @klass = Klass.new
    respond_with(@klass)
  end

  def edit
  end

  def create
    @klass = Klass.new(klass_params)
    @klass.save
    respond_with(@klass)
  end

  def update
    @klass.update(klass_params)
    respond_with(@klass)
  end

  def destroy
    @klass.destroy
    respond_with(@klass)
  end

  private
    def set_klass
      @klass = current_user.projects.find_by_id(params[:pid]).klasses.find_by_id(params[:kid])
    end

    def klass_params
      params[:klass]
    end
end
