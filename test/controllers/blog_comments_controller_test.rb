require 'test_helper'

class BlogCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get blog_comments_new_url
    assert_response :success
  end

  test "should get create" do
    get blog_comments_create_url
    assert_response :success
  end

  test "should get show" do
    get blog_comments_show_url
    assert_response :success
  end

  test "should get edit" do
    get blog_comments_edit_url
    assert_response :success
  end

  test "should get update" do
    get blog_comments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get blog_comments_destroy_url
    assert_response :success
  end

end
