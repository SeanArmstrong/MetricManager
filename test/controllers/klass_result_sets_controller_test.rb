require 'test_helper'

class KlassResultSetsControllerTest < ActionController::TestCase
  setup do
    @klass_result_set = klass_result_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:klass_result_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create klass_result_set" do
    assert_difference('KlassResultSet.count') do
      post :create, klass_result_set: {  }
    end

    assert_redirected_to klass_result_set_path(assigns(:klass_result_set))
  end

  test "should show klass_result_set" do
    get :show, id: @klass_result_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @klass_result_set
    assert_response :success
  end

  test "should update klass_result_set" do
    patch :update, id: @klass_result_set, klass_result_set: {  }
    assert_redirected_to klass_result_set_path(assigns(:klass_result_set))
  end

  test "should destroy klass_result_set" do
    assert_difference('KlassResultSet.count', -1) do
      delete :destroy, id: @klass_result_set
    end

    assert_redirected_to klass_result_sets_path
  end
end
