require 'test_helper'

class ExpensesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:expenses)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_expense
    assert_difference('Expense.count') do
      post :create, :expense => { }
    end

    assert_redirected_to expense_path(assigns(:expense))
  end

  def test_should_show_expense
    get :show, :id => expenses(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => expenses(:one).id
    assert_response :success
  end

  def test_should_update_expense
    put :update, :id => expenses(:one).id, :expense => { }
    assert_redirected_to expense_path(assigns(:expense))
  end

  def test_should_destroy_expense
    assert_difference('Expense.count', -1) do
      delete :destroy, :id => expenses(:one).id
    end

    assert_redirected_to expenses_path
  end
end
