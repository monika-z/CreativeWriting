require 'test_helper'

class TriosControllerTest < ActionController::TestCase
  setup do
    @trio = trios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trio" do
    assert_difference('Trio.count') do
      post :create, trio: { first_id: @trio.first_id, second_id: @trio.second_id, third_id: @trio.third_id }
    end

    assert_redirected_to trio_path(assigns(:trio))
  end

  test "should show trio" do
    get :show, id: @trio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trio
    assert_response :success
  end

  test "should update trio" do
    patch :update, id: @trio, trio: { first_id: @trio.first_id, second_id: @trio.second_id, third_id: @trio.third_id }
    assert_redirected_to trio_path(assigns(:trio))
  end

  test "should destroy trio" do
    assert_difference('Trio.count', -1) do
      delete :destroy, id: @trio
    end

    assert_redirected_to trios_path
  end
end
