require 'minitest_helper'

class TestParserMltiStatus < Minitest::Test
  def test_boc_device_multi_status
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.4.3.2435.5.36.11.0')
    result = MIBParser::Parser::MultiStatus.new(oid).parse('0000271101009C5502009C56030027E204009C660500F2A50600EA650700284C08009C80090028410A0075400B002FA90C00EAFD0D009C4A0E00C3500F0114F4FF')
    assert_equal '10001', result['Not_Error']
    assert_equal '40021', result['Cover_Open']
    assert_equal '40022', result['Paper_Jams']
    assert_equal '10210', result['Toner_Low_Ink_Low']
    assert_equal '40038', result['Replace_Toner_Ink']
    assert_equal '62117', result['Replace_Drum']
    assert_equal '60005', result['Consumable_Warnings_User_Repairable']
    assert_equal '10316', result['Consumable_Errors_User_Repairable']
    assert_equal '40064', result['Consumable_Warnings_Requires_Service_Engineer']
    assert_equal '10305', result['Consumable_Errors_Requires_Service_Engineer']
    assert_equal '30016', result['Memory_Errors']
    assert_equal '12201', result['Paper_Input_Errors']
    assert_equal '60157', result['Paper_Output_Errors']
    assert_equal '40010', result['Installation_Errors']
    assert_equal '50000', result['Hardware_Mechanical_Errors']
    assert_equal '70900', result['Miscellaneous_Errors']
  end
end
