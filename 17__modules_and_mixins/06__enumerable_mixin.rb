# What is a mixin?
#   * A mixin is a module that injects additional behaviour into a class
#   * Mixins allow us to mimic inheritance from more than one class
#   * A class that includes a module has access to its methods and constants
#   * Constants and methods mixed into a class do not need to be prefixed with the module name

# Modules (Mixins) vs Inheritance:
#   * Class inheritance should be used for an "is-a" relationship
#     E.g., Array is a type of Object, Integer is a type of Numeric
#   * Modules should be used for a "has-a" relationship
#     E.g., String has a Comparable feature set

# The method lookup path (.ancestors method shows a full path):
#   1. Modules included with :prepend keyword
#   2. Class definition
#   3. Included modules
#       (the order that modules are included in class matters:
#         first of all, Ruby looks at the last module included in the class
#         if multiple modules mix in methods with the same name, the last module included in the class will be used first)
#   4. Parent classes
#   5. Ruby will throw an error if the method is not found in the class, the modules or any superclasses (`method_missing`)

# Why mix in modules to classes?
#   * Different classes need similar functionalities
#     E.g. String and Numeric both need `<`, `>`, `==`, ...
#     Neither class can be represented as a subclass of the other
#   * Duplication of methods across classes violates the DRY principle

class ConvenienceStore
  include Enumerable

  attr_reader :snacks

  def initialize
    @snacks = []
  end

  def add_snack(snack)
    snacks << snack
  end

  # Need to create each method to tell Ruby how to iterate objects
  def each
    return enum_for(:each) unless block_given? # returns enumerator if no block provided
    snacks.each { |snack| yield(snack) }
  end
end

bodega = ConvenienceStore.new

bodega.add_snack("Doritos")
bodega.add_snack("Jolly Ranchers")
bodega.add_snack("Slim Jim")

bodega.snacks #=> ["Doritos", "Jolly Ranchers", "Slim Jim"]

bodega.each      #=> #<Enumerator: ...>
bodega.each.next #=> "Doritos"
bodega.first     #=> "Doritos" (used enumerator for `.first` method)

bodega.each { |snack| p "#{snack} is delicious" }
# OUTPUT:
#   "Doritos is delicious"
#   "Jolly Ranchers is delicious"
#   "Slim Jim is delicious"

bodega.any? { |snack| snack.length > 10 } #=> true
bodega.all? { |snack| snack.length > 10 } #=> false
bodega.map { |snack| snack.upcase }       #=> ["DORITOS", "JOLLY RANCHERS", "SLIM JIM"]
bodega.sort                               #=> ["Doritos", "Jolly Ranchers", "Slim Jim"]
