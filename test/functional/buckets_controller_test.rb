require 'test_helper'

class BucketsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:buckets)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_bucket
    assert_difference('Bucket.count') do
      post :create, :bucket => { }
    end

    assert_redirected_to bucket_path(assigns(:bucket))
  end

  def test_should_show_bucket
    get :show, :id => buckets(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => buckets(:one).id
    assert_response :success
  end

  def test_should_update_bucket
    put :update, :id => buckets(:one).id, :bucket => { }
    assert_redirected_to bucket_path(assigns(:bucket))
  end

  def test_should_destroy_bucket
    assert_difference('Bucket.count', -1) do
      delete :destroy, :id => buckets(:one).id
    end

    assert_redirected_to buckets_path
  end
end
