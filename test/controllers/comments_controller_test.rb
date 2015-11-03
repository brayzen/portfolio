require "test_helper"

class CommentsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_response :success
  end

  def test_edit
    get :edit
    assert_response :success
  end

  def test_destroy
    get :destroy
    assert_response :success
  end

end
