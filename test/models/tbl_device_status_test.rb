require 'test_helper'

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
          assert_equal(sample[value], key)
        end
      end
    end
  end
end
