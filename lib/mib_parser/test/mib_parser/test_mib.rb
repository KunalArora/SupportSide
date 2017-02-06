require 'minitest_helper'

class TestMIB < Minitest::Test
  def test_load_default_yaml
    mib = ::MIBParser::MIB.load

    assert_equal 253, mib.keys.size
  end
end
