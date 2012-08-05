require 'test_helper'

class DelitoSecundariosControllerTest < ActionController::TestCase
  setup do
    @delito_secundario = delito_secundarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:delito_secundarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create delito_secundario" do
    assert_difference('DelitoSecundario.count') do
      post :create, :delito_secundario => @delito_secundario.attributes
    end

    assert_redirected_to delito_secundario_path(assigns(:delito_secundario))
  end

  test "should show delito_secundario" do
    get :show, :id => @delito_secundario.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @delito_secundario.to_param
    assert_response :success
  end

  test "should update delito_secundario" do
    put :update, :id => @delito_secundario.to_param, :delito_secundario => @delito_secundario.attributes
    assert_redirected_to delito_secundario_path(assigns(:delito_secundario))
  end

  test "should destroy delito_secundario" do
    assert_difference('DelitoSecundario.count', -1) do
      delete :destroy, :id => @delito_secundario.to_param
    end

    assert_redirected_to delito_secundarios_path
  end
end
