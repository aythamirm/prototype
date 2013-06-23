class InterruptionsController < ApplicationController
  
  def create
    params[:interruption].merge!(task_id: params[:task_id], start_time: DateTime.parse(params[:interruption][:start_time]))
    interruption = Interruption.create interruption_params
    interruption.task.pause! if interruption.valid?
    render json: interruption
  end

  def stop_interruption
    interruption = current_user.tasks.find(params[:task_id]).interruptions.where(end_time: nil).first
    interruption.task.activate! if interruption.update_attribute(:end_time, Time.now)
    render json: interruption
  end

  private

  def interruption_params
    params.require(:interruption).permit(:name, :description, :start_time, :end_time, :task_id)
  end  
end	