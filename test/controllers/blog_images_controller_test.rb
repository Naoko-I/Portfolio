require 'test_helper'

class BlogImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get blog_images_new_url
    assert_response :success
  end

  test "should get create" do
    get blog_images_create_url
    assert_response :success
  end

  test "should get edit" do
    get blog_images_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get blog_images_destroy_url
    assert_response :success
  end

  test "should get update" do
    get blog_images_update_url
    assert_response :success
  end

end
