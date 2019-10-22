class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  AGENT=["Agent1","Agent2","Agent3"]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  def agent_name(skill)
     occupied_list=[]
     p skill
      AgentList.all.each do |summary|
        if summary.skills==skill
         if summary.status=="F"
            return summary.name
         elsif summary.status=="O"
            if summary.priority=="Low"
             return summary.name
            else
             occupied_list.push({:name=>summary.name,:last_task_time=>summary.last_task_time})
            end
          end
        end
      end
      if occupied_list.size>0
        sorted=occupied_list.sort_by!{|item| item[:last_task_time]} 
        a=sorted.first
        return a["name"]
      end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    name=agent_name(task_params[:skills])
    p name
    # occupied_list.values.sort
    # free_list=AgentList.find_by_status("F")
    # if free_list.size.size
    #  if summary.status.skill==task_params[:skill]
    #   return free_list.first.name
    # end
    # else
    #   occupied_list=AgentList.find_by_status("O")
    #   .map(&:agent)[0]
    # end

    # if completed_list.size>0
    #   return completed_list.map(&:agent)[0]
    # elsif started_list.size>0
    #   started_list
    # end


    @task = Task.new(task_params.merge({:current_agent=>name}))
    respond_to do |format|
      if !name.nil? && @task.save
        agent=AgentList.find_by_name(name)
        agent.update(:status=>"O")
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        p "hhhhhh"
        format.html { redirect_to "/tasks/new" ,notice: 'All Agent is occupied with this skill.Please try diffrent skill.'}
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :skills, :status, :priority, :current_agent)
    end
end
