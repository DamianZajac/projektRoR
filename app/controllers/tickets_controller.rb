class TicketsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @ticket = @project.ticets.create(ticket_params)
    redirect_to project_path(@project)
  end
  
  private
    def ticket_params
      params.require(:ticket).permit(:name_ticet)
    end
end
