require 'test_helper'

class SpecialControllerTest < ActionController::TestCase
  test "should get specials" do
    get :specials
    assert_response :success
  end

end
