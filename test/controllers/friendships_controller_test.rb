require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get only:" do
    get friendships_only:_url
    assert_response :success
  end

  test "should get [:destroy]" do
    get friendships_[:destroy]_url
    assert_response :success
  end

end
