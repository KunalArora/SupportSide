require 'minitest_helper'

class TestMIBParser < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::MIBParser::VERSION
  end
end
