class MethodResultSetsController < ApplicationController
  before_action :set_method_result_set, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @method_result_sets = MethodResultSet.all
    respond_with(@method_result_sets)
  end

  def show
    respond_with(@method_result_set)
  end

  def new
    @method_result_set = MethodResultSet.new
    respond_with(@method_result_set)
  end

  def edit
  end

  def create
    @method_result_set = MethodResultSet.new(method_result_set_params)
    flash[:notice] = 'MethodResultSet was successfully created.' if @method_result_set.save
    respond_with(@method_result_set)
  end

  def update
    flash[:notice] = 'MethodResultSet was successfully updated.' if @method_result_set.update(method_result_set_params)
    respond_with(@method_result_set)
  end

  def destroy
    @method_result_set.destroy
    respond_with(@method_result_set)
  end

  private
    def set_method_result_set
      @method_result_set = MethodResultSet.find(params[:id])
    end

    def method_result_set_params
      params[:method_result_set]
    end
end
