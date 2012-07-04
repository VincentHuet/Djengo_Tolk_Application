require 'test_helper'

class TranslatorsControllerTest < ActionController::TestCase
  setup do
    @translator = translators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:translators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create translator" do
    assert_difference('Translator.count') do
      post :create, translator: { locale_id: @translator.locale_id, name: @translator.name, password: @translator.password }
    end

    assert_redirected_to translator_path(assigns(:translator))
  end

  test "should show translator" do
    get :show, id: @translator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @translator
    assert_response :success
  end

  test "should update translator" do
    put :update, id: @translator, translator: { locale_id: @translator.locale_id, name: @translator.name, password: @translator.password }
    assert_redirected_to translator_path(assigns(:translator))
  end

  test "should destroy translator" do
    assert_difference('Translator.count', -1) do
      delete :destroy, id: @translator
    end

    assert_redirected_to translators_path
  end
end
