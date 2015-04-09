class MethoodsController < ApplicationController
  before_action :set_methood, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @methoods = current_user.projects.find_by_id(params[:pid]).klasses.find_by_id(params[:kid]).methoods
    respond_with(@methoods)
  end

  def show
    if @methood.present?
      set_task_info
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

  def hidetasks
    @methood =  Methood.find_by_id(params[:id])
    flash[:notice] = 'Method was successfully updated.' if @methood.set_tasks_to_hidden
    redirect_to :back
  end

  def displaytasks
    @methood =  Methood.find_by_id(params[:id])
    flash[:notice] = 'Method was successfully updated.' if @methood.set_tasks_to_visible
    redirect_to :back
  end

  private
    def set_methood
      @methood = current_user.projects.find_by_id(params[:pid]).klasses.find_by_id(params[:kid]).methoods.find_by_id(params[:mid])
    end

    def methood_params
      params[:methood]
    end

    def set_task_info
      taskstart = @methood.klass.project.tasks.where(visible_on_graphs: true).map do |task|
        {name: "Start #{task.name}", data: [[task.start_date, 0]]}
      end

      taskcomplete = @methood.klass.project.tasks.where(visible_on_graphs: true, complete: true).map do |task|
        {name: "Completed #{task.name}", data: [[task.completed_at, 0]]}
      end 

      taskcomplete.each do |tc|
       taskstart.prepend(tc)
      end 

      @tasks = taskstart
    end
end
