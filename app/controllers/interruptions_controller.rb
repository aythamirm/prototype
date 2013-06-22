class InterruptionsController < ApplicationController
  def create
    params[:interruption].merge!(task_id: params[:task_id], start_time: Time.now)
    interruption = Interruption.create params[:interruption] 
    render json: interruption
  end
end	