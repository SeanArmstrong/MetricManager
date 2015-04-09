class KlassesController < ApplicationController
  before_action :set_klass, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @klasses = current_user.projects.find_by_id(params[:pid]).klasses
    respond_with(@klasses)
  end

  def show
    if @klass.present?
      set_task_info
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

  def hidetasks
    @klass =  Klass.find_by_id(params[:id])
    flash[:notice] = 'Klass was successfully updated.' if @klass.set_tasks_to_hidden
    redirect_to :back
  end

  def displaytasks
    @klass =  Klass.find_by_id(params[:id])
    flash[:notice] = 'Klass was successfully updated.' if @klass.set_tasks_to_visible
    redirect_to :back
  end

  private
    def set_klass
      @klass = current_user.projects.find_by_id(params[:pid]).klasses.find_by_id(params[:kid])
    end

    def klass_params
      params[:klass]
    end

    def set_task_info
      taskstart = @klass.project.tasks.where(visible_on_graphs: true).map do |task|
        {name: "Start #{task.name}", data: [[task.start_date, 0]]}
      end

      taskcomplete = @klass.project.tasks.where(visible_on_graphs: true, complete: true).map do |task|
        {name: "Completed #{task.name}", data: [[task.completed_at, 0]]}
      end 

      taskcomplete.each do |tc|
       taskstart.prepend(tc)
      end 

      @tasks = taskstart
    end
end
