# use hash instead of array
class Frog
    def self.crossing(leafs_num, hash)
        raise "must be hash" unless hash.is_a?(Hash)
        raise "must be int" unless leafs_num.is_a?(Integer)
        raise "false attributes" unless leafs_num.between?(1, 100_000)
        raise "false attributes" unless hash.size.between?(1, 100_000)
        reverse_hash = {}
        hash.each do |time, leaf|
          reverse_hash[leaf] ||= []
          reverse_hash[leaf] << time
        end
        return -1 if (1..leafs_num).to_a.any? { |n| reverse_hash[n].nil?  || reverse_hash[n].empty? }
        reverse_hash.values.map(&:min).flatten.max
    end
end