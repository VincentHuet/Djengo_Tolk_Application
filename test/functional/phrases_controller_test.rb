require 'test_helper'

class PhrasesControllerTest < ActionController::TestCase
  setup do
    @phrase = phrases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phrases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phrase" do
    assert_difference('Phrase.count') do
      post :create, phrase: { key: @phrase.key }
    end

    assert_redirected_to phrase_path(assigns(:phrase))
  end

  test "should show phrase" do
    get :show, id: @phrase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @phrase
    assert_response :success
  end

  test "should update phrase" do
    put :update, id: @phrase, phrase: { key: @phrase.key }
    assert_redirected_to phrase_path(assigns(:phrase))
  end

  test "should destroy phrase" do
    assert_difference('Phrase.count', -1) do
      delete :destroy, id: @phrase
    end

    assert_redirected_to phrases_path
  end
end
