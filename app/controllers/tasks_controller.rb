class TasksController < ApplicationController
  include TheSortableTreeController::Rebuild
  def index
    @interruption = Interruption.new 
    @nodes = current_user.nodes
    @task = Task.new
    @project = Project.new
    @filter = params[:filter].present? ? Filter.new(params[:filter]) : Filter.new
    @calendar_nodes = current_user.tasks.where('start_time is not NULL')
    @date = params[:month] ? Date.parse(params[:month].gsub('-', '/')) : Date.today
    state_filte    
    by_gtd_state
    

    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @nodes }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    @parent = current_user.projects.first
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end


  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.build(task_params)

    if @task.save 
      flash[:notice] = 'Task successfully created'
    else
      flash[:alert] = 'Please review your data'
    end
    redirect_to tasks_path
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update_attributes(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Node.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_path}
      format.json { head :no_content }
    end
    
  end

  def trash
    @nodes = current_user.nodes.where(action: "Trash" )
    @nodes.each do |n| 
      n.destroy
    end  
    respond_to do |format|
      format.html { redirect_to "http://localhost:3000/tasks?key=trash" }
      format.json { head :no_content }
    end
  end  

  def start
     current_user.tasks.find(params[:task_id]).activate!
     render json: true
  end 

  def finish 
    #TODO: chequear interrup 
    current_user.tasks.find(params[:task_id]).finish!.params[:finish_time] = time.now
    suma = 0.0
    current_user.tasks.interruptions.where('interruptions.duration IS NOT NULL  ').each do |valor|
        suma = suma + valor.duration  
    end    
    current_user.params[:unproductive_time] = suma
    current_user.params[:productive_time] = (DateTime.parse(params[:finish_time].to_s)- DateTime.parse(params[:created_at].to_s))-(suma)
    @task = current_user.tasks.find(params[:task_id]).finish!
    render json: true
  end 

  def by_gtd_state
    @nodes = @nodes.where(action: params[:key].capitalize) if params[:key]
  end
   
  def state
    node = current_user.nodes.find(params[:task_id])
    node_old_action = node.action.downcase
    if node.type == 'Task'
      node.update_attribute(:action, params[:key].capitalize) if params[:key]
    else
      node.update_attribute(:action, params[:key].capitalize) if params[:key]  
    end
    render json: { old_action: node_old_action, new_action: node.action.downcase }
  end

  def reload_month
    @date = Date.parse(params[:month].gsub('-', '/')) 
    @calendar_nodes = current_user.tasks.where('start_time is not NULL') 
    render partial: 'calendar' 
  end

  def reload_tree
    @nodes = current_user.nodes
    state_filte   
    by_gtd_state
    render partial: 'tree'
  end  
  
  def state_filte
    if params[:filter].present?
        # prueba
        if params[:filter][:search] != ""
          @nodes = current_user.tasks.where(task_name: params[:filter][:search])  
        end
        if params[:filter][:state] == "to_do"
          @nodes = current_user.tasks.where(state: params[:filter][:state])
        end  

        if params[:filter][:state]== "paused" 
            @nodes = current_user.tasks.where(state: params[:filter][:state])
        end  
        if params[:filter][:state]== "finished"
          @nodes = current_user.tasks.where(state: params[:filter][:state])
        end  
      end  
    end  
  private

  def task_params
    params.require(:task).permit(:task_name,:estimated_time, :due_date, :note, :priority, :parent_id, :action, :start_time)
  end   
end