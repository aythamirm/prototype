class InterruptionsController < ApplicationController
  def create
    params[:interruption].merge!(task_id: params[:task_id], start_time: Time.now)
    interruption = Interruption.create interruption_params
    render json: interruption
  end
  private
  def interruption_params
    params.require(:interruption).permit(:name, :description, :start_time, :end_time, :task_id)
  end  

end	