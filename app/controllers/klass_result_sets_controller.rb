class KlassResultSetsController < ApplicationController
  before_action :set_klass_result_set, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @klass_result_sets = KlassResultSet.all
    respond_with(@klass_result_sets)
  end

  def show
    respond_with(@klass_result_set)
  end

  def new
    @klass_result_set = KlassResultSet.new
    respond_with(@klass_result_set)
  end

  def edit
  end

  def create
    @klass_result_set = KlassResultSet.new(klass_result_set_params)
    flash[:notice] = 'KlassResultSet was successfully created.' if @klass_result_set.save
    respond_with(@klass_result_set)
  end

  def update
    flash[:notice] = 'KlassResultSet was successfully updated.' if @klass_result_set.update(klass_result_set_params)
    respond_with(@klass_result_set)
  end

  def destroy
    @klass_result_set.destroy
    respond_with(@klass_result_set)
  end

  private
    def set_klass_result_set
      @klass_result_set = KlassResultSet.find(params[:id])
    end

    def klass_result_set_params
      params[:klass_result_set]
    end
end
