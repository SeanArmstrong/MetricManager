class TasksController < ApplicationController
  before_action :set_project, except: [:complete, :uncomplete]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tasks = current_user.projects.find_by_id(params[:project_id]).tasks 
    respond_with(@project, @tasks)
  end

  def show
    if @task.present?
      respond_with(@project, @task)
    end
  end

  def new
    @task = Task.new(project_id: params[:project_id])
    respond_with(@project, @task)
  end

  def edit
  end

  def create
    @task = Task.new(project_id: params[:project_id])
    @task.name = params[:task][:name]
    @task.description = params[:task][:description]
    @task.due_date = params[:task][:due_date]
    flash[:notice] = 'Task was successfully created.' if @task.save
    respond_with(@project, @task)
  end

  def update
    flash[:notice] = 'Task was successfully updated.' if @task.update(task_params)
    respond_with(@project, @task)
  end

  def destroy
    @task.destroy
    respond_with(@project, @task)
  end

  def complete
    @task = Task.find_by_id(params[:id])
    @task.set_to_completed
    respond_with(@task.project)
  end

  def uncomplete
    @task = Task.find_by_id(params[:id])
    @task.set_to_uncompleted
    respond_with(@task.project)
  end

  private
    def set_task
      #@task = current_user.projects.find_by_id(params[:project_id]).tasks.find(params[:tid])
      @task = @project.tasks.find(params[:id])
    end

    def set_project
      @project = current_user.projects.find_by_id(params[:project_id])
    end

    def task_params
      params[:task]
    end
end
