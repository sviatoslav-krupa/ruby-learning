# Notes:
#   * Symbol - lightweight String. It doesn't include as many methods as String, so it uses less memory
#   * For strings, Ruby allocates memory for the string, and clears memory if the are no pointers to the string anymore
#   * For symbols, Ruby allocates memory for the symbol (without duplicates, same object in memory for same symbol), and don't clear memory so frequent
#   * .methods - list of all available methods on an abject

:name                 #=> :name
:name.class           #=> Symbol
:name.methods.length  #=> 90

"name"                #=> "name"
"name".class          #=> String
"name".methods.length #=> 195

# Ruby
#   * allocates memory for the string "Not efficient symbol"
#   * converts the string to symbol (one more memory allocation)
#   * clears memory from the string
:"Not efficient symbol" #=> :"Not efficient symbol"

# Ruby just
#   * allocates memory for the string "More efficient string"
#   * clears memory from the string if it's not used anymore
"More efficient string" #=> "More efficient string"

str = "test"
dup_str = "test"
str.object_id == dup_str.object_id #=> false

sym = :test
dup_sym = :test
sym.object_id == dup_sym.object_id #=> true (no copies for Symbol, just one object in memory)

person = {
  :name => "Sviat",
  :age => 24,
  :handsome => true,
  :languages => %w[Ruby JavaScript]
}

# Shorthand syntax from Ruby 1.9 for hash with symbols as keys
person = {
  name: "Sviat",
  age: 24,
  handsome: true,
  languages:  %w[Ruby JavaScript]
}
person[:name]         #=> "Sviat"
person[:age]          #=> 24
person[:handsome]     #=> true
person[:languages]    #=> ["Ruby" "JavaScript"]
person[:languages][0] #=> "Ruby"
person["name"]        #=> nil

# Edge cases:
# Shorthand syntax from Ruby 3.1 for hash when you have a variable name that also matches the key that you want to add to a hash
red = 230
green = 0
blue = 50
colors = { red:, green:, blue: } # the same as `color = { red: red, green: green, blue: blue }`
colors        #=> {red: 230, green: 0, blue: 50}
colors[:red]  #=> 230
colors = { red:, green:, blue:, orange: } #=> undefined method 'orange' for main (NoMethodError)
