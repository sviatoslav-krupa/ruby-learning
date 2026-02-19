# Notes:
#   * Singleton method - method that only exists on one single instance
#   * Singleton classes can exist for classes and for objects

class Player
  def play_game
    rand(1..100) > 50 ? "Winner!" : "Loser!"
  end
end

bob = Player.new
john = Player.new

# defining a singleton method
def john.cheat
  "Winner!"
end

bob.play_game   #=> "Winner!"
john.play_game  #=> "Loser!"

bob.cheat   #=> undefined method `cheat' for #<Player:0x00007fe4a5a37ac8> (NoMethodError)
john.cheat  #=> "Winner!"

# Method overriding
def john.play_game
  "Winner!"
end

john.play_game #=> "Winner!" (always)

john.class.ancestors #=> [Player, Object, JSON::Ext::Generator::GeneratorMethods::Object, PP::ObjectMixin, Kernel, BasicObject]
bob.class.ancestors  #=> [Player, Object, JSON::Ext::Generator::GeneratorMethods::Object, PP::ObjectMixin, Kernel, BasicObject]

bob                   #=> #<Player:0x00007fe4a5a37ac8>
bob.singleton_class   #=> #<Class:#<Player:0x00007fe4a5a37ac8>>
bob.singleton_methods #=> []

john                   #=> #<Player:0x00007fe4aa8ce9c0>
john.singleton_class   #=> #<Class:#<Player:0x00007fe4aa8ce9c0>>
john.singleton_methods #=> [:cheat, :play_game]

# Edge cases:
intro = "Hy, my name is Sviat"

module A
  def reverse_and_upcase
    reverse.upcase
  end
end

class << intro # accessing singleton class (including module into singleton class)
  include A
end

intro.reverse_and_upcase   #=> "TAIVS SI EMAN YM ,YH"
"hello".reverse_and_upcase #=> undefined method 'reverse_and_upcase' for an instance of String (NoMethodError)

intro.class           #=> String
intro.class.ancestors #=> [String, JSON::Ext::Generator::GeneratorMethods::String, Comparable, Object, JSON::Ext::Generator::GeneratorMethods::Object, PP::ObjectMixin, Kernel, BasicObject]

intro.singleton_class           #=> #<Class:#<String:0x0000000127d2eec0>>
intro.singleton_class.ancestors #=> [#<Class:#<String:0x0000000127d2eec0>>, A, String, JSON::Ext::Generator::GeneratorMethods::String, Comparable, Object, JSON::Ext::Generator::GeneratorMethods::Object, PP::ObjectMixin, Kernel, BasicObject]

intro.singleton_class.class      #=> Class
intro.singleton_class.superclass #=> String

# Class methods are just instance methods of singleton class :)
class Foo
  def self.bar # accessing singleton class
    "Bar"
  end

  class << self # accessing singleton class
    def baz
      "Baz"
    end
  end
end

Foo.bar #=> "Bar"
Foo.baz #=> "Baz"

Foo                                  #=> Foo
Foo.singleton_class                  #=> #<Class:Foo>
Foo.singleton_methods                #=> [:baz, :bar, :yaml_tag]
Foo.singleton_class.instance_methods #=> [:bar, :baz, :yaml_tag... ]
Foo.singleton_class.class            #=> Class
Foo.singleton_class.superclass       #=> #<Class:Object
