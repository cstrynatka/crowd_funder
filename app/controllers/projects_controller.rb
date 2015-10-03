class ProjectsController < ApplicationController

  # before_filter :require_login, only: [:new, :create]
  # before_filter :require_login, except: [:index, :show]
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.owner = current_user
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def update
    @project = Project.find_by_id(params[:id])
    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def edit
    @project = Project.find_by_id(params[:id])
  end

  def destroy
  end

  def show
    @project = Project.find(params[:id])
    if current_user
      @project_update
      # @show_overlay = current_user.intro.nil?
      # current_user.update_attribute(:intro, true)
    end
  end

  def index
    if params[:tag]
      @projects = Project.tagged_with(params[:tag])
    else
       @projects = Project.all
    end
  end

  private 
  	def project_params
  		params.require(:project).permit(:title, :description, :user_id)
  	end
end
