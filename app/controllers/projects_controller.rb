class ProjectsController < ApplicationController
  def index
  	@project = Project.all
  end

  def new
  	@project = Project.new
  end

  def show
  	@project = Project.find(params[:id])
  end

  def create
  	@project = Project.new(project_params)

  	if @project.save
  		redirect_to projects_url
  	else
  		render :new
  	end
  end

  private 
  	def project_params
  		params.require(:project).permit(:title, :description, :user_id)
  	end
end
