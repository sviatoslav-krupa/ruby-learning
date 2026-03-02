# Notes:
#   * When Ruby runs into the error - it stops executing the file!
#   * TypeError - if some object doesn't have an expected type for some kind of operation
#   * NameError - if Ruby can't find a name that we are referencing in our program
#   * NoMethodError - when we reference a method that doesn't exist on an object
#   * RuntimeError - the default one that Ruby is going to use whenever it has an error that is happening at runtime,
#                    which means when the program runs but Ruby doesn't know the specifics
#   * Deprecation warning - when something is deprecated and will be removed in the future; it's not an error
#   * `RUBYOPT="-W:deprecated" ruby script.rb` - to see deprecation warnings

# TypeError
"4" + 3 #=> no implicit conversion of Integer into String (TypeError)
3 + "4" #=> String can't be coerced into Integer (TypeError)

# NameError
favorite_food = "Sushi"
favoritefood #=> undefined local variable or method 'favoritefood' for main (NameError)

# NoMethodError
"hello".lenth #=> undefined method 'lenth' for an instance of String (NoMethodError)
5.length      #=> undefined method 'length' for an instance of Integer (NoMethodError)

# RuntimeError
raise "There will be a Runtime error"
