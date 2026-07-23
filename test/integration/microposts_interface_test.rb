require "test_helper"

class MicropostsInterface < ActionDispatch::IntegrationTest
  include Paginatable

  def setup
    @user = users(:michael)
    log_in_as(@user)
  end
end

class MicropostsInterfaceTest < MicropostsInterface

  test "should paginate microposts" do
    get root_path
    assert_select 'div#pagination'
  end

  test "should show errors but not create micropost on invalid submission" do
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { content: "" } }
    end
    assert_select 'div#error_explanation'
  end

  test "should have micropost delete links on own profile page" do
    get users_path(@user)
    assert_select 'a', text: 'DELETE'
  end

  test "should not have delete links on other user's profile page" do
    get user_path(users(:archer))
    assert_select 'a', { text: 'delete', count: 0 }
  end

  test "should be able to delete own micropost" do
    @pagination, @micropost = paginate(@user.microposts, per_page: 10)
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(@micropost.first)
    end
  end

  test "should create a micropost on valid submission" do
    content = "This micropost really ties the room together"
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: { micropost: { content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
  end
end
