require 'test_helper'

class MicroBlogsControllerTest < ActionController::TestCase
  setup do
    @micro_blog = micro_blogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:micro_blogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create micro_blog" do
    assert_difference('MicroBlog.count') do
      post :create, micro_blog: { content: @micro_blog.content, title: @micro_blog.title }
    end

    assert_redirected_to micro_blog_path(assigns(:micro_blog))
  end

  test "should show micro_blog" do
    get :show, id: @micro_blog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @micro_blog
    assert_response :success
  end

  test "should update micro_blog" do
    patch :update, id: @micro_blog, micro_blog: { content: @micro_blog.content, title: @micro_blog.title }
    assert_redirected_to micro_blog_path(assigns(:micro_blog))
  end

  test "should destroy micro_blog" do
    assert_difference('MicroBlog.count', -1) do
      delete :destroy, id: @micro_blog
    end

    assert_redirected_to micro_blogs_path
  end
end
