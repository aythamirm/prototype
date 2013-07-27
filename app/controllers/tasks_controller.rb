class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @interruption = Interruption.new 
    @nodes = current_user.nodes.all
    @task = Task.new
    @project = Project.new
    @filter = params[:filter].present? ? Filter.new(params[:filter]) : Filter.new
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

  private

  def task_params
    params.require(:task).permit(:task_name,:estimated_time, :due_date, :note, :priority, :parent_id)
  end   
end
