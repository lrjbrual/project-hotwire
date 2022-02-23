class ProjectsController < ApplicationController
  before_action :set_id, only: [:edit, :update, :show, :destroy]
  def index
    @projects = Project.all
    @project = Project.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: "Project was created!"  }
      else 
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(@project, partial: "projects/form", locals: {project: @project}) }
        format.html { render :new, status: :unprocessable_entity  }
      end
    end

  end

  def edit
  end

  def show 
    @task = @project.tasks.build
    @tasks = @project.tasks
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
          format.html{ redirect_to projects_path, notice: "Successfullly updated!"}
        else 
          format.turbo_stream {
            render turbo_stream: turbo_stream.replace(@project, partial: "projects/form", locals: {project: @project}) }
          format.html { render :new}
      end
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: "Project deleted"
  end

  private 

  def set_id 
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:content, :vote)
  end
end
