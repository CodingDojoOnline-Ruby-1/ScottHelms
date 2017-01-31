require 'test_helper'

class GuessesControllerTest < ActionController::TestCase
  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get replay" do
    get :replay
    assert_response :success
  end

end
