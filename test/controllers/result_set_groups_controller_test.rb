require 'test_helper'

class ResultSetGroupsControllerTest < ActionController::TestCase
  setup do
    @result_set_group = result_set_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:result_set_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create result_set_group" do
    assert_difference('ResultSetGroup.count') do
      post :create, result_set_group: {  }
    end

    assert_redirected_to result_set_group_path(assigns(:result_set_group))
  end

  test "should show result_set_group" do
    get :show, id: @result_set_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @result_set_group
    assert_response :success
  end

  test "should update result_set_group" do
    patch :update, id: @result_set_group, result_set_group: {  }
    assert_redirected_to result_set_group_path(assigns(:result_set_group))
  end

  test "should destroy result_set_group" do
    assert_difference('ResultSetGroup.count', -1) do
      delete :destroy, id: @result_set_group
    end

    assert_redirected_to result_set_groups_path
  end
end
