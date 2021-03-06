class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
 
  def show
   @project = Project.find(params[:id])
  end
  
  def edit
   @project = Project.find(params[:id])
  end
  
  def update
  @project = Project.find(params[:id])
  if @project.update(project_params)
    flash[:notice] = "Project has been updated."
    redirect_to @project
  else
    flash.now[:alert] = "Project has not been updated."
    render "edit"
 end 
end
  
private
  def project_params
    params.require(:project).permit(:name, :description)
  end
end  