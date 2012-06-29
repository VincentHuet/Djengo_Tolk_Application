require 'test_helper'

class YmlSourcesControllerTest < ActionController::TestCase
  setup do
    @yml_source = yml_sources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yml_sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yml_source" do
    assert_difference('YmlSource.count') do
      post :create, yml_source: { name: @yml_source.name, path: @yml_source.path }
    end

    assert_redirected_to yml_source_path(assigns(:yml_source))
  end

  test "should show yml_source" do
    get :show, id: @yml_source
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yml_source
    assert_response :success
  end

  test "should update yml_source" do
    put :update, id: @yml_source, yml_source: { name: @yml_source.name, path: @yml_source.path }
    assert_redirected_to yml_source_path(assigns(:yml_source))
  end

  test "should destroy yml_source" do
    assert_difference('YmlSource.count', -1) do
      delete :destroy, id: @yml_source
    end

    assert_redirected_to yml_sources_path
  end
end
