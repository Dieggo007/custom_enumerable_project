module Enumerable
  # Your code goes here
  def my_all?
    self.my_each do |elem|
      return false unless yield(elem)
    end
    true
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_count
    return self.size unless block_given?
    count = 0
    self.my_each do |elem|
      count += 1 if yield(elem)
    end
    count
  end

  def my_each_with_index
    i = 0
    self.my_each do |elem|
      yield(elem, i)
      i += 1
    end
  end

  def my_inject(default_value = 0)
    sum = default_value
    self.my_each do |elem|
      sum = yield(sum, elem)
    end
    sum
  end

  def my_map
    new_arr = []
    self.my_each do |elem|
      new_arr << yield(elem)
    end
    new_arr
  end

  def my_none?
    self.my_each do |elem|
      return false if yield(elem)
    end
    true
  end

  def my_select
    new_arr = []
    self.my_each do |elem|
      new_arr << elem if yield(elem)
    end
    new_arr
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end
end

