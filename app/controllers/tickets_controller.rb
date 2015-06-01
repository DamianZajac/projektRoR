class TicketsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.all
  end
  
  def new
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.new
  end
  
  def create
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.create(ticket_params)
    redirect_to project_tickets_path(@project, @ticket)
  end
 
  private
  def ticket_params
    params.require(:ticket).permit(:title, :description, :piority, :difficulty, :status)
    end
end
