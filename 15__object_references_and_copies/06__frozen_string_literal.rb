# Notes:
#   * `frozen_string_literal: true` - magic comment that prevents string literals (only literals!) from being modified
#   * Improves performance by avoiding unnecessary string allocations and mutations
#   * Should be placed at the top of the file, before any other code

puts "Sviat".object_id #=> 6065
puts "Sviat".object_id #=> 6345

puts "Sviat" << " is awesome" #=> "Sviat is awesome"

# frozen_string_literal: true
# or enable it with the flag: `RUBYOPT="--enable-frozen-string-literal" ruby script.rb`

"Sviat".object_id #=> 16
"Sviat".object_id #=> 16 (same object id because it's frozen)

"Sviat" << " is awesome"              #=> can't modify frozen String: "Sviat" (FrozenError)
String.new("Sviat") << " is awesome"  #=> "Sviat is awesome" (`String.new` is not a literal, ASCII-8BIT encoding)
+"Sviat" << " is awesome"             #=> "Sviat is awesome" (preferred way because it's more efficient, UTF-8 encoding)
