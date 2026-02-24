# Notes:
#   * `extend self` - makes all methods in the module available as class methods

module Bar
  def foo
    "bar"
  end
end
Bar.foo #=> undefined method 'foo' for module Bar (NoMethodError)

class A
  include Bar
end
A.foo     #=> undefined method 'foo' for class A (NoMethodError)
A.new.foo #=> "bar"

class B
  extend Bar
end
B.foo     #=> "bar"
B.new.foo #=> undefined method 'foo' for an instance of B (NoMethodError)

# Reopens the module
module Bar
  extend self # works like `extend Bar` in class definition, here `self` == `Bar`; works with `include` as well
end
Bar.foo #=> "bar"

# Class methods in modules are just instance methods of singleton class :)
# They can't be mixed into classes or instances
module Bar
  def self.first_class_method
    "first class method"
  end

  class << self
    def second_class_method
      "second class method"
    end
  end
end
Bar.first_class_method  #=> "first class method"
Bar.second_class_method #=> "second class method"

A.first_class_method  #=> undefined method 'first_class_method' for class A (NoMethodError)
A.second_class_method #=> undefined method 'second_class_method' for class A (NoMethodError)
B.first_class_method  #=> undefined method 'first_class_method' for class B (NoMethodError)
B.second_class_method #=> undefined method 'second_class_method' for class B (NoMethodError)

A.new.first_class_method  #=> undefined method 'first_class_method' for #<A:0x00000001246bbf78> (NoMethodError)
A.new.second_class_method #=> undefined method 'second_class_method' for #<A:0x00000001246bbf78> (NoMethodError)
B.new.first_class_method  #=> undefined method 'first_class_method' for #<B:0x00000001246bbf78> (NoMethodError)
B.new.second_class_method #=> undefined method 'second_class_method' for #<B:0x00000001246bbf78> (NoMethodError)
