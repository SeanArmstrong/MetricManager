class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @projects = current_user.projects
    respond_with(@projects)
  end

  def show 
    if @project.present?
      set_task_info
      respond_with(@project)
    else
      redirect_to root_path
    end
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    @project.save
    if @project.errors.any?
      flash[:error] = "Could not create project. See errors below."
    else
      flash[:success] = "Project Created Successfully."
    end
    respond_with(@project)
  end

  def update
    @project.update(project_params)
    if @project.errors.any?
      flash[:error] = "Could not create project. See errors below."
    else
      flash[:success] = "Project Updated Successfully."
    end
    respond_with(@project)
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project Deleted Successfully." if @project.destroyed?
    respond_with(@project)
  end

  private
    def set_project
      @project = current_user.projects.find_by_id(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :display_tasks);
    end

    def set_task_info
      taskstart = @project.tasks.where(visible_on_graphs: true).map do |task|
        {name: "Start #{task.name}", data: [[task.start_date, 0]]}
      end

      taskcomplete = @project.tasks.where(visible_on_graphs: true, complete: true).map do |task|
        {name: "Completed #{task.name}", data: [[task.completed_at, 0]]}
      end 

      taskcomplete.each do |tc|
       taskstart.prepend(tc)
      end 

      @tasks = taskstart
    end
end
