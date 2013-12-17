# def frog(x, a)
#   return 'False attributes' unless a.is_a?(Array) &&
#                                   a.size.between?(1, 100_000) &&
#                                   x.is_a?(Integer) &&
#                                   x <= a.max &&
#                                   x.between?(1, 100_000)
#   return -1 unless a.include?(x)
#   rez = (1..x).to_a - a
#   return rez.empty? ? a.index(x) : -1
# end

def should_start_crossing_at(leafs_num, hash)
    raise "must be NxM hash" unless hash.is_a?(Hash) # hash is a hash!

    # The solution is simple
    # First we reverse the hash so the keys are the leafs and values are minutes
    reverse_hash = {}
    hash.each do |time, leaf|
      reverse_hash[leaf] ||= []
      reverse_hash[leaf] << time
    end

    # There's a leaf that will never fall from the tree so frog will die
    # In this case return -1 (it should raise FrogDeath error in my opinion)
    return -1 if (1..leafs_num).to_a.any? { |n| reverse_hash[n].nil?  || reverse_hash[n].empty? }

    # reverse_hash will return this values:
    # leaf minutes_sorted_asc
    # 1    0 2
    # 2    4
    # 3    1 5
    # 4    3 7
    # 5    6

    # We take the first row and return maximum, that will be the answer
    reverse_hash.values.map(&:min).flatten.max
end

puts should_start_crossing_at(5, {0=>1, 1=>3, 2=>1, 3=>4, 4=>2, 5=>3, 6=>5, 7=>4})