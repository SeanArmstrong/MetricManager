require 'test_helper'

class MethoodsControllerTest < ActionController::TestCase
  setup do
    @methood = methoods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:methoods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create methood" do
    assert_difference('Methood.count') do
      post :create, methood: {  }
    end

    assert_redirected_to methood_path(assigns(:methood))
  end

  test "should show methood" do
    get :show, id: @methood
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @methood
    assert_response :success
  end

  test "should update methood" do
    patch :update, id: @methood, methood: {  }
    assert_redirected_to methood_path(assigns(:methood))
  end

  test "should destroy methood" do
    assert_difference('Methood.count', -1) do
      delete :destroy, id: @methood
    end

    assert_redirected_to methoods_path
  end
end
