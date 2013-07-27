class FiltersController < ApplicationController
def Post
  @respuesta=false
  if request.post?
    if params[:search] != " "
      @respuesta = current_user.tasks.find(params[:task_id]).where(params[:search])
    else
      if params[:state]
        case params[:state]
          when "to_do"
            @respuesta = current_user.tasks.find(params[:task_id]).where(params[:state][:to_do])
          when "active"
            @respuesta = current_user.tasks.find(params[:task_id]).where(params[:state][:active])
          when "finished"
            @respuesta = current_user.tasks.find(params[:task_id]).where(params[:state][:finished])
          when "paused"
            @respuesta = current_user.tasks.find(params[:task_id]).where(params[:state][:paused])
          else
            @respuesta=false
          end  
      end  
    end  
  end  
end	