# test/models/paginator_test.rb
require "test_helper"

class PaginatorTest < ActiveSupport::TestCase

  def setup
    @user = users(:archer)

    25.times do |i|
      @user.microposts.create!(content: "Micropost #{i + 1}")
    end

    @scope = @user.microposts.order(created_at: :desc)
  end

  test "calculates page limits, offsets, and totals correctly" do
    paginator = Paginator.new(@scope, page: 1, per_page: 10)

    assert_equal 10, paginator.records.count
    assert_equal 3, paginator.total_pages
    assert_equal 1, paginator.current_page
    assert_equal 2, paginator.next_page
    assert_nil paginator.prev_page
    assert paginator.first_page?
    refute paginator.last_page?
  end

  test "handles second page and middle offsets" do
    paginator = Paginator.new(@scope, page: 2, per_page: 10)

    assert_equal 10, paginator.records.count
    assert_equal 10, paginator.offset
    assert_equal 2, paginator.current_page
    assert_equal 3, paginator.next_page
    assert_equal 1, paginator.prev_page
  end

  test "handles last page remaining items" do
    paginator = Paginator.new(@scope, page: 2, per_page: 10)

    assert_equal 10, paginator.records.count
    assert_equal 3, paginator.next_page
    assert_equal 1, paginator.prev_page
    assert_not paginator.last_page?
  end

  test "sanitizes invalid page inputs safely" do
    # Negative or zero pages fallback to 1
    paginator_zero = Paginator.new(@scope, page: 0, per_page: 10)
    assert_equal 1, paginator_zero.current_page

    paginator_invalid = Paginator.new(@scope, page: "abc", per_page: -5)
    assert_equal 1, paginator_invalid.current_page
    assert_equal 10, paginator_invalid.per_page # Default fallback
  end
end
