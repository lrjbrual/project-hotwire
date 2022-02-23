class TasksController < ApplicationController
  before_action :project_id, only: [:create, :edit, :update, :show]
  before_action :set_id, only: [:edit, :update, :destroy, :show]

  def create 
    @task = @project.tasks.build(tasks_params)
    if @task.save 
      flash[:notice] = "task successfully created!"
      redirect_to project_path(@project)
    else 
      flash[:alert] = "task has not been created"
      render 'project/show'
    end
  end

  def edit 
  end

  def update 
    respond_to do |f|
      if @task.update(tasks_params)
        f.html{ redirect_to([@task.project, @task], notice: 'Task was successfully updated.')}
      else
        render action: 'edit'
      end
    end
  end

  def show 

  end

  def destroy 
    @task.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@task) }
      format.html         { redirect_to project_path(@project) }
    end
  end

  private 

  def set_id 
    @task = Task.find(params[:id])
  end

  def project_id 
    @project = Project.where(id:params[:project_id]).first
  end

  def tasks_params 
    params.required(:task).permit(:body, :status)
  end
end
