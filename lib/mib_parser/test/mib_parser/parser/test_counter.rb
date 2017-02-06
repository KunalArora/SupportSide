require 'minitest_helper'

class TestParserCounter < Minitest::Test
  def test_br_scan_count_counter
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.54.2.2.1.3.1')
    result = MIBParser::Parser::Counter.new(oid).parse('721')
    assert_equal '721', result
    assert_equal '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.54.2.2.1.2.1', oid.pair_oid
  end

  def test_br_print_pages_func_counter
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.21.1.3.1')
    result = MIBParser::Parser::Counter.new(oid).parse('999')
    assert_equal '999', result
    assert_equal '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.21.1.2.1', oid.pair_oid
  end

  def test_br_print_pages
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.1.1.3.1')
    result = MIBParser::Parser::Counter.new(oid).parse('999')
    assert_equal '999', result
    assert_equal '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.1.1.2.1', oid.pair_oid
  end

  def test_br_print_page_classified_sxdx_counter
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.2.1.3.1')
    result = MIBParser::Parser::Counter.new(oid).parse('999')
    assert_equal '999', result
    assert_equal '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.2.1.2.1', oid.pair_oid
  end

  def test_br_printpages_classified_sx_counter
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.3.1.3.1')
    result = MIBParser::Parser::Counter.new(oid).parse('999')
    assert_equal '999', result
    assert_equal '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.3.1.2.1', oid.pair_oid
  end

  def test_br_printpages_classified_dx_counter
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.4.1.3.1')
    result = MIBParser::Parser::Counter.new(oid).parse('999')
    assert_equal '999', result
    assert_equal '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.4.1.2.1', oid.pair_oid
  end

  def test_br_printpages_sxdx_papersize_papertype_counter
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.42.1.3.1')
    result = MIBParser::Parser::Counter.new(oid).parse('999')
    assert_equal '999', result
    assert_equal '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.42.1.2.1', oid.pair_oid
  end
end
