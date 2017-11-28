require 'test_helper'
require 'csv'
class TblDeviceStatusTest < ActiveSupport::TestCase

  test 'should convert item keys and merge values correctly' do
    %w(las_1 las_2 ink_1 ink_2 ink_3 ink_4).each do |file_name|
      sample = {}
      File.open("test/sample_#{file_name}_rename.csv") do |file|
        file.each do |line|
          tmp = line.chomp!.split(",",2)
          sample[tmp[1]] = tmp[0]
        end
      end
      rawdata = TblDeviceStatus.new
      rawdata.status = File.read("test/sample_#{file_name}.csv")
      @item = rawdata.get_item
      item_renamed = rawdata.rename_item_key(@item)
      item_renamed.each_key do |category|
        item_renamed[category].each do |key, value|
          value = value[0] if value.class == Array
          assert_equal(sample[value], key)
        end
      end
    end
  end

  test 'should distingish key whose value is splited correctly on map' do
    array_expected = []
    CSV.foreach('test/split_key_list.csv') do |row|
      array_expected << row
    end
    array_expected.flatten!
    hash ={}
    array = []
    Map77listItemRename.each do |category, names|
        hash = names.select{|k,v|
        v.include?(:split)
      }
      hash.each_key do |k|
        array << k
      end
    end
    array.size.times.each do |i|
      assert_equal array_expected[i], array[i]
    end
  end
end
