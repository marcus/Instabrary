require File.dirname(__FILE__) + '/../test_helper'
require 'booksets_controller'

# Re-raise errors caught by the controller.
class BooksetsController; def rescue_action(e) raise e end; end

class BooksetsControllerTest < Test::Unit::TestCase
  def setup
    @controller = BooksetsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:booksets)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_bookset
    assert_difference('Bookset.count') do
      post :create, :bookset => { }
    end

    assert_redirected_to bookset_path(assigns(:bookset))
  end

  def test_should_show_bookset
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_update_bookset
    put :update, :id => 1, :bookset => { }
    assert_redirected_to bookset_path(assigns(:bookset))
  end

  def test_should_destroy_bookset
    assert_difference('Bookset.count', -1) do
      delete :destroy, :id => 1
    end

    assert_redirected_to booksets_path
  end
end
