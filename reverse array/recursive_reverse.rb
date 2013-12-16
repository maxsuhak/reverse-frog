class Array
  def recursive_reverse
    return self if empty?
    [pop, *recursive_reverse]
  end
end
