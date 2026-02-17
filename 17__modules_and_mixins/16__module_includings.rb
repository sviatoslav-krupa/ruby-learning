module Example
  class << self
    attr_reader :includers
  end

  # calls each time when a class includes this module
  def self.included(base)
    @includers ||= []
    @includers << base
  end
end

class A
  include Example
end

class B
  include Example
end

# `included_modules` - get all modules that out class has (includes)
A.included_modules #=> [Example, JSON::Ext::Generator::GeneratorMethods::Object, PP::ObjectMixin, Kernel]
B.included_modules #=> [Example, JSON::Ext::Generator::GeneratorMethods::Object, PP::ObjectMixin, Kernel]

# `ObjectSpace` - like a container for all classes
ObjectSpace.each_object(Class).select { |klass| klass.included_modules.include?(Example) } #=> [B, A]
Example.includers #=> [A, B]
