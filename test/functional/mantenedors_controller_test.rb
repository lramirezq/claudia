require 'test_helper'

class MantenedorsControllerTest < ActionController::TestCase
  setup do
    @mantenedor = mantenedors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mantenedors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mantenedor" do
    assert_difference('Mantenedor.count') do
      post :create, :mantenedor => @mantenedor.attributes
    end

    assert_redirected_to mantenedor_path(assigns(:mantenedor))
  end

  test "should show mantenedor" do
    get :show, :id => @mantenedor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mantenedor.to_param
    assert_response :success
  end

  test "should update mantenedor" do
    put :update, :id => @mantenedor.to_param, :mantenedor => @mantenedor.attributes
    assert_redirected_to mantenedor_path(assigns(:mantenedor))
  end

  test "should destroy mantenedor" do
    assert_difference('Mantenedor.count', -1) do
      delete :destroy, :id => @mantenedor.to_param
    end

    assert_redirected_to mantenedors_path
  end
end
