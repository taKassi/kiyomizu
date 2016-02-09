require 'minitest_helper'

class TestKiyomizu < MiniTest::Unit::TestCase
  def test_that_it_has_a_version_number
    refute_nil ::Kiyomizu::VERSION
  end

  def test_should_be_greeting
    greeting = Kiyomizu.greet
    assert_equal greeting, 'Hello! My name is "Kiyomizu".'
  end
end
