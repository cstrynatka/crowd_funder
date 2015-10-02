class ProjectController < ApplicationController

  def new
  	@project = Project.new
  end


  def create
  	@project = Project.new(project_params)
  	@project.owner = current_user
  	if @project.save
  		redirect_to new_project_breakpoint_path(@project)
  	else
  		render :new
  	end
  end


  def update
  	@project = Project.find(params[:id])
  	if @project.update_attributes(project_params)
  		redirect_to project_path(@project)
  	else
  		render :edit
  	end
  end

  def edit
  	@project = Project.find(params[:id])
  end


  def destroy
  end


  def show
  	@project = Project.find(params[:id])
  	if current_user
  		@show_overlay = current_user.intro.nil?
  		current_user.update_attribute(:intro, true)
  	end
  end

  def index
  	@projects = Project.all.newest_first
  end

  private
  	def project_params
  		params.require(:project).permit(:name, :user_id, :goal_in_cents, :start_date, :end_date, :description, :image, :tag_list)
  	end
end
