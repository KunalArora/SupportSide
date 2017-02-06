require 'minitest_helper'

class TestParserComposite < Minitest::Test
  def test_info_counter
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.10.0')
    result = MIBParser::Parser::Composite.new(oid).parse('0001040000031CFF')
    assert_equal '796', result['Total_Page_Count']
  end

  def test_info_counter_all
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.10.0')
    result = MIBParser::Parser::Composite.new(oid).parse('0001040000031C0101040000031C0201040000031C1201040000031C1301040000031C1401040000031C1501040000031C1601040000031C6001040000031CD001040000031CD101040000031CD201040000031CFF')
    assert_equal 12, result.size
  end

  def test_info_counter_all_with_lower_case_terminater
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.10.0')
    result = MIBParser::Parser::Composite.new(oid).parse('0001040000031C0101040000031C0201040000031C1201040000031C1301040000031C1401040000031C1501040000031C1601040000031C6001040000031CD001040000031CD101040000031CD201040000031Cff')
    assert_equal 12, result.size
  end

  def test_info_maintenance_drum_count_bkcmy
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0')
    result = MIBParser::Parser::Composite.new(oid).parse('7601040000000277010400000002780104000000027F0104000000026801040000000255010400000001310104000000013201040000000133010400000001340104000000017001040000264882010400000064710104000026AC8301040000006472010400002648840104000000646F0104000026AC81010400000064790104000003E87A0104000003E87B0104000003E8800104000003E8690104000003E8730104000034C2740104000034C2750104000034C27E0104000034C254010400000001350104000000016A010400001C846D010400002710FF')
    assert_equal '13506', result['Drum_Count_Black']
    assert_equal '13506', result['Drum_Count_Cyan']
    assert_equal '13506', result['Drum_Count_Magenta']
    assert_equal '13506', result['Drum_Count_Yellow']
  end

  def test_info_maintenance_drum_count_total
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0')
    result = MIBParser::Parser::Composite.new(oid).parse('6301040000000111010400000EF341010400002260310104000000016F010400001EDC81010400000050670104000000016B010400000E745401040000000166010400000001350104000000016A010400000E746C0104000027106D0104000025E4FF')
    assert_equal '3827', result['Drum_Count']
  end

  def test_info_maintenance_ink_status
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0')
    result = MIBParser::Parser::Composite.new(oid).parse('31010400000001320104000000023301040000000334010400000004FF')
    assert_equal '1', result['TonerInk_Black']
    assert_equal '2', result['TonerInk_Cyan']
    assert_equal '3', result['TonerInk_Magenta']
    assert_equal '4', result['TonerInk_Yellow']
  end

  def test_info_maintenance_ink_life
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0')
    result = MIBParser::Parser::Composite.new(oid).parse('81010400000032820104000000568301040000006484010400000011FF')
    assert_equal '50', result['TonerInk_LifeBlack']
    assert_equal '86', result['TonerInk_LifeCyan']
    assert_equal '100', result['TonerInk_LifeMagenta']
    assert_equal '17', result['TonerInk_LifeYellow']
  end

  def test_info_maintenance_ink_life_mps
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0')
    result = MIBParser::Parser::Composite.new(oid).parse('6F01040000238C7001040000200871010400001C8472010400001900FF')
    assert_equal '9100', result['TonerInk_LifeBlack_MPS']
    assert_equal '8200', result['TonerInk_LifeCyan_MPS']
    assert_equal '7300', result['TonerInk_LifeMagenta_MPS']
    assert_equal '6400', result['TonerInk_LifeYellow_MPS']
  end

  def test_info_maintenance_drum_unit_status
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0')
    result = MIBParser::Parser::Composite.new(oid).parse('7601040000000C77010400000022780104000000387F01040000004EFF')
    assert_equal '12', result['Drum_Unit_Cyan']
    assert_equal '34', result['Drum_Unit_Magenta']
    assert_equal '56', result['Drum_Unit_Yellow']
    assert_equal '78', result['Drum_Unit_Black']
  end

  def test_info_maintenance_belt_and_waste_toner_box
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0')
    result = MIBParser::Parser::Composite.new(oid).parse('55010400000002680104000000036901040000157CFF')
    assert_equal '2', result['Waste_Toner_Box']
    assert_equal '3', result['Belt_Unit']
    assert_equal '5500', result['Belt_Life']
  end

  def test_info_next_care_1
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.11.0')
    result = MIBParser::Parser::Composite.new(oid).parse('A4010400003A6EA5010400003A6EA6010400003A6EA7010400003A6E8801040000C2ED7301040000C3507701040000C3507801040000C3507901040000C3508401040000C350FF')
    assert_equal '14958', result['Drum_Unit_Black_Remaining_Life']
    assert_equal '14958', result['Drum_Unit_Cyan_Remaining_Life']
    assert_equal '14958', result['Drum_Unit_Magenta_Remaining_Life']
    assert_equal '14958', result['Drum_Unit_Yellow_Remaining_Life']
    assert_equal '49901', result['Belt_Unit_Remaining_Life']
    assert_equal '50000', result['Fuser_Unit_Remaining_Life']
    assert_equal '50000', result['Paper_Feeding_Kit_1_Remaining_Life']
    assert_equal '50000', result['Paper_Feeding_Kit_2_Remaining_Life']
    assert_equal '50000', result['Paper_Feeding_Kit_3_Remaining_Life']
    assert_equal '50000', result['Paper_Feeding_Kit_4_Remaining_Life']
  end

  def test_info_next_care_2
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.11.0')
    result = MIBParser::Parser::Composite.new(oid).parse('8201040000662289010400008FA673010400008FA68601040000C2D377010400017AA6C101040000BE36C201040000BE368101040000C2EDFF')
    assert_equal '26146', result['Drum_Unit_Remaining_Life']
    assert_equal '36774', result['Laser_Unit_Remaining_Life']
    assert_equal '49875', result['Paper_Feeding_Kit_MP_Remaining_Life']
    assert_equal '48694', result['Pickup_Roller_Remaining_Life']
    assert_equal '48694', result['Separation_Pad_Remaining_Life']
    assert_equal '49901', result['Scanner_Unit_Remaining_Life']
  end

  def test_info_coverage
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.18.0')
    result = MIBParser::Parser::Composite.new(oid).parse('000200530102004A020200390302021BFF')
    assert_equal '0.83', result['Black_Coverage']
    assert_equal '0.74', result['Cyan_Coverage']
    assert_equal '0.57', result['Magenta_Coverage']
    assert_equal '2.27', result['Yellow_Coverage']
  end

  def test_info_replace_count
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.20.0')
    result = MIBParser::Parser::Composite.new(oid).parse('870100A10101A20101A30101820100A00102880100890100730100860100770100A70100A40100A50100A60100780100790100840100810100FF')
    assert_equal '0', result['Waste_Toner_Box_Replace_Count']
    assert_equal '1', result['TonerInk_Cyan_Replace_Count']
    assert_equal '1', result['TonerInk_Magenta_Replace_Count']
    assert_equal '1', result['TonerInk_Yellow_Replace_Count']
    assert_equal '0', result['Drum_Unit_Replace_Count']
    assert_equal '2', result['TonerInk_Black_Replace_Count']
    assert_equal '0', result['Belt_Unit_Replace_Count']
    assert_equal '0', result['Laser_Unit_Replace_Count']
    assert_equal '0', result['Fuser_Unit_Replace_Count']
    assert_equal '0', result['Paper_Feeding_Kit_MP_Replace_Count']
    assert_equal '0', result['Drum_Unit_Black_Replace_Count']
    assert_equal '0', result['Drum_Unit_Cyan_Replace_Count']
    assert_equal '0', result['Drum_Unit_Magenta_Replace_Count']
    assert_equal '0', result['Drum_Unit_Yellow_Replace_Count']
    assert_equal '0', result['Paper_Feeding_Kit_1_Replace_Count']
    assert_equal '0', result['Paper_Feeding_Kit_2_Replace_Count']
    assert_equal '0', result['Paper_Feeding_Kit_3_Replace_Count']
    assert_equal '0', result['Paper_Feeding_Kit_4_Replace_Count']
    assert_equal '0', result['Scanner_Unit_Replace_Count']
  end
  
  def test_info_jam_count
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.21.0')
    result = MIBParser::Parser::Composite.new(oid).parse('000200000102000C0202001A0302001104020000210200172202003323020004240200002502000026020000A10400000095FF')
    assert_equal '0', result['Jam_MP_Tray']
    assert_equal '12', result['Jam_Tray_1']
    assert_equal '26', result['Jam_Tray_2']
    assert_equal '17', result['Jam_Tray_3']
    assert_equal '0', result['Jam_Tray_4']
    assert_equal '23', result['Jam_Inside']
    assert_equal '51', result['Jam_Rear']
    assert_equal '4', result['Jam_2sided']
    assert_equal '0', result['Jam_MailBox_OP_Output_Tray']
    assert_equal '149', result['Jam_Total']
    assert_equal '0', result['Jam_ADF_1sided']
    assert_equal '0', result['Jam_ADF_2sided']
  end

  def test_marker_supplies_usage_print
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.59.0')
    result = MIBParser::Parser::Composite.new(oid).parse('0101050007A78C9F0201050002253096030105000201F66B040105012A05F200FF')
    assert_equal '128421023', result['Print_Black_Ink']
    assert_equal '35991702', result['Print_Yellow_Ink']
    assert_equal '33683051', result['Print_Cyan_Ink']
    assert_equal '5000000000', result['Print_Magenta_Ink']
  end

  def test_marker_supplies_usage_cleaning
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.59.0')
    result = MIBParser::Parser::Composite.new(oid).parse('050105000389C2FF0601050003FA862F0701050003FA862F0801050003FA862FFF')
    assert_equal '59359999', result['Cleaning_Black_Ink']
    assert_equal '66749999', result['Cleaning_Yellow_Ink']
    assert_equal '66749999', result['Cleaning_Cyan_Ink']
    assert_equal '66749999', result['Cleaning_Magenta_Ink']
  end
end
