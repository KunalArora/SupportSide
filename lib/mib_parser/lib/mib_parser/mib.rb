module MIBParser
  class MIB
    DEFAULT_MIB_PATH = File.join(File.dirname(__FILE__), 'mib.yml')

    class << self
      def load
        @mib = YAML.load_file(DEFAULT_MIB_PATH)
        indexing
        @mib
      end

      private
      def indexing
        index_mib = {}
        @mib.each do |oid, mib|
          next unless mib['index'] && mib['id_map']
          next unless @mib[mib['pair_oid']]
          next unless @mib[mib['pair_oid']]['pair_oid'] == oid

          mib['id_map'].each_key.with_index do |_k, i|
            count_type_mib_oid = "#{oid}.#{i}"
            counter_mib_oid = "#{mib['pair_oid']}.#{i}"

            count_type_mib = mib.dup
            count_type_mib['pair_oid'] = counter_mib_oid

            counter_mib = @mib[mib['pair_oid']].dup
            counter_mib['pair_oid'] = count_type_mib_oid

            index_mib[count_type_mib_oid] = count_type_mib
            index_mib[counter_mib_oid] = counter_mib
          end
        end
        @mib.merge!(index_mib)
      end
    end
  end
end
