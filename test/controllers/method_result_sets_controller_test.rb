require 'test_helper'

class MethodResultSetsControllerTest < ActionController::TestCase
  setup do
    @method_result_set = method_result_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:method_result_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create method_result_set" do
    assert_difference('MethodResultSet.count') do
      post :create, method_result_set: {  }
    end

    assert_redirected_to method_result_set_path(assigns(:method_result_set))
  end

  test "should show method_result_set" do
    get :show, id: @method_result_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @method_result_set
    assert_response :success
  end

  test "should update method_result_set" do
    patch :update, id: @method_result_set, method_result_set: {  }
    assert_redirected_to method_result_set_path(assigns(:method_result_set))
  end

  test "should destroy method_result_set" do
    assert_difference('MethodResultSet.count', -1) do
      delete :destroy, id: @method_result_set
    end

    assert_redirected_to method_result_sets_path
  end
end
