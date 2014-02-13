require 'set'

def intersection(list1, list2)
  set = Set.new
  result_set = Set.new

  list1.each do |item|
    set.add item
  end

  list2.each do |item|
    result_set.add(iteam) if set.include(item)
  end

  result_set.to_a
end