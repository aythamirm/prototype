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
    by_gtd_state
    

    respond_to do |format|
      format.html # index.html.erb
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
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def start
     current_user.tasks.find(params[:task_id]).activate!
     render json: true
  end 

  def finish 
    @task = current_user.tasks.find(params[:task_id]).finish!
    render json: true
  end 

  def by_gtd_state
    @nodes = @nodes.where(action: params[:key].capitalize) if params[:key]
  end
   
  def state
  # código aquí
  end 

  private

  def task_params
    params.require(:task).permit(:task_name,:estimated_time, :due_date, :note, :priority, :parent_id, :action, :start_time)
  end   
end