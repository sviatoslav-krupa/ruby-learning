# Notes:
#   * `require`, `require_relative` - executes file only once
#   * `require` - by default look for a file in Ruby installation folder
#   * `require_relative` - by default look for a file in current directory of the file
#   * `require_relative` "..." == require "./..."
#   * Should not have an extension of the file in the end of the file path
#   * Use to import some functionality (class, method)
#   * `require`, `require_relative` and `load` can be lazy loaded inside conditions or methods, not necessarily at the top of a file

puts "This is the beginning!"

# Just one execution for both `require` and `require_relative` of the same file, but not for `load`
load "05_06__the_end.rb"
require "./05_06__the_end"
require "./05_06__the_end"
require_relative "05_06__the_end"
require_relative "05_06__the_end"

# OUTPUT:
#   This is the beginning!
#   This is the end!
#   This is the end!
