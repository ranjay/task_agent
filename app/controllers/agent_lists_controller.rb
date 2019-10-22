class AgentListsController < ApplicationController
  before_action :set_agent_list, only: [:show, :edit, :update, :destroy]

  # GET /agent_lists
  # GET /agent_lists.json
  def index
    @agent_lists = AgentList.all
  end

  # GET /agent_lists/1
  # GET /agent_lists/1.json
  def show
  end

  # GET /agent_lists/new
  def new
    @agent_list = AgentList.new
  end

  # GET /agent_lists/1/edit
  def edit
  end

  # POST /agent_lists
  # POST /agent_lists.json
  def create
    @agent_list = AgentList.new(agent_list_params)

    respond_to do |format|
      if @agent_list.save
        format.html { redirect_to @agent_list, notice: 'Agent list was successfully created.' }
        format.json { render :show, status: :created, location: @agent_list }
      else
        format.html { render :new }
        format.json { render json: @agent_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agent_lists/1
  # PATCH/PUT /agent_lists/1.json
  def update
    respond_to do |format|
      if @agent_list.update(agent_list_params)
        format.html { redirect_to @agent_list, notice: 'Agent list was successfully updated.' }
        format.json { render :show, status: :ok, location: @agent_list }
      else
        format.html { render :edit }
        format.json { render json: @agent_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agent_lists/1
  # DELETE /agent_lists/1.json
  def destroy
    @agent_list.destroy
    respond_to do |format|
      format.html { redirect_to agent_lists_url, notice: 'Agent list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent_list
      @agent_list = AgentList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agent_list_params
      params.require(:agent_list).permit(:name, :skills, :status, :priority, :last_task_time)
    end
end
