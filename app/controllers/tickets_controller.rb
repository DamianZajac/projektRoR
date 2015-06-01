class TicketsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.all
  end
  
  def show
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.find(params[:id])
  end
  
  def new
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.new
  end
  
  def edit
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.find(params[:id])
  end
  
  def create
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.create(ticket_params)
    redirect_to project_tickets_path(@project, @ticket)
  end
  
  def update
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.find(params[:id])
    if @ticket.update(ticket_params)
      redirect_to project_ticket_path(@project.id, @ticket)
    else
      render 'edit'
    end
  end
  
  def destroy
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.find(params[:id])
    @ticket.destroy
    redirect_to project_tickets_path(@project, @ticket)
  end
 
  private
  def ticket_params
    params.require(:ticket).permit(:title, :description, :priority, :difficulty, :status)
    end
end
