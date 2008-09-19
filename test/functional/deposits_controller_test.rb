require 'test_helper'

class DepositsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:deposits)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_deposit
    assert_difference('Deposit.count') do
      post :create, :deposit => { }
    end

    assert_redirected_to deposit_path(assigns(:deposit))
  end

  def test_should_show_deposit
    get :show, :id => deposits(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => deposits(:one).id
    assert_response :success
  end

  def test_should_update_deposit
    put :update, :id => deposits(:one).id, :deposit => { }
    assert_redirected_to deposit_path(assigns(:deposit))
  end

  def test_should_destroy_deposit
    assert_difference('Deposit.count', -1) do
      delete :destroy, :id => deposits(:one).id
    end

    assert_redirected_to deposits_path
  end
end
