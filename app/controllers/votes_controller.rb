class VotesController < ApplicationController 
  before_action :set_vote, only: :create

  def create 
    @project.increment! :vote
    redirect_to projects_path
  end

  private 

  def set_vote 
    @project = Project.find(params[:project_id])
  end

end