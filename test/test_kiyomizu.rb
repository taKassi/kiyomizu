require 'minitest_helper'

class TestKiyomizu < MiniTest::Unit::TestCase
  def test_that_it_has_a_version_number
    refute_nil ::Kiyomizu::VERSION
  end

  def test_jbma_should_be_greeting
    crawler = Kiyomizu.jbma
    assert_equal crawler.greet, 'Hello! This crawler is Bill Maintenance!!'
  end
end
