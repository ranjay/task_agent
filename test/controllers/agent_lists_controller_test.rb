require 'test_helper'

class AgentListsControllerTest < ActionController::TestCase
  setup do
    @agent_list = agent_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agent_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create agent_list" do
    assert_difference('AgentList.count') do
      post :create, agent_list: { last_task_time: @agent_list.last_task_time, name: @agent_list.name, priority: @agent_list.priority, skills: @agent_list.skills, status: @agent_list.status, status: @agent_list.status }
    end

    assert_redirected_to agent_list_path(assigns(:agent_list))
  end

  test "should show agent_list" do
    get :show, id: @agent_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @agent_list
    assert_response :success
  end

  test "should update agent_list" do
    patch :update, id: @agent_list, agent_list: { last_task_time: @agent_list.last_task_time, name: @agent_list.name, priority: @agent_list.priority, skills: @agent_list.skills, status: @agent_list.status, status: @agent_list.status }
    assert_redirected_to agent_list_path(assigns(:agent_list))
  end

  test "should destroy agent_list" do
    assert_difference('AgentList.count', -1) do
      delete :destroy, id: @agent_list
    end

    assert_redirected_to agent_lists_path
  end
end
