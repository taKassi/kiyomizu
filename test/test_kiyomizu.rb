require 'minitest_helper'

class TestKiyomizu < MiniTest::Unit::TestCase
  def test_that_it_has_a_version_number
    refute_nil ::Kiyomizu::VERSION
  end

  def test_should_be_greeting
    jbma = Kiyomizu.jbma
    townpage = Kiyomizu.townpage

    assert_equal jbma.greet, 'Hello! this crawler is JBma!!'
    assert_equal townpage.greet, 'Hello! this crawler is TownPage!!'

  end
end
