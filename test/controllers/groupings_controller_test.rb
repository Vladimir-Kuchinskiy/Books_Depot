require 'test_helper'

class GroupingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grouping = groupings(:one)
  end

  test "should get index" do
    get groupings_url
    assert_response :success
  end

  test "should get new" do
    get new_grouping_url
    assert_response :success
  end

  test "should create grouping" do
    assert_difference('Grouping.count') do
      post groupings_url, params: { grouping: {  } }
    end

    assert_redirected_to grouping_url(Grouping.last)
  end

  test "should show grouping" do
    get grouping_url(@grouping)
    assert_response :success
  end

  test "should get edit" do
    get edit_grouping_url(@grouping)
    assert_response :success
  end

  test "should update grouping" do
    patch grouping_url(@grouping), params: { grouping: {  } }
    assert_redirected_to grouping_url(@grouping)
  end

  test "should destroy grouping" do
    assert_difference('Grouping.count', -1) do
      delete grouping_url(@grouping)
    end

    assert_redirected_to groupings_url
  end
end
