require File.dirname(__FILE__) + '/../test_helper'
require 'book_statuses_controller'

# Re-raise errors caught by the controller.
class BookStatusesController; def rescue_action(e) raise e end; end

class BookStatusesControllerTest < Test::Unit::TestCase
  fixtures :book_statuses

  def setup
    @controller = BookStatusesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
