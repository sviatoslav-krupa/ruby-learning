# What is an exception?
#   * An exception is an error in your program
#   * An error is a point in code where Ruby cannot correctly evaluate the code that it's been given
#   * Rescue means to save program by intercepting the error if it occurs and reacting to it
#   * `begin...end` - the section of the code that can go wrong
#   * `rescue` - section with the code that describes what to do in case if error occurs
#   * `else` - section with the code that runs ONLY if no exceptions raised
#   * Inside a method, `begin` and `end` keywords can be omitted

def sum(a, b)
  begin
    a + b
  rescue # works with every type of error
    "Unknown"
  end
end

# Another syntax for methods
def sum(a, b)
  a + b
rescue # works with every type of error
  "Unknown"
end

sum(3, 5)     #=> 8
sum(3, "5")   #=> "Unknown"
sum(nil, nil) #=> "Unknown"

# `else` keyword
def sum(a, b)
  puts a + b
rescue
  puts "Unknown"
else
  puts "No rescue"
end

sum(3, 5) #=> nil
# OUTPUT:
#   8
#   No rescue (no exceptions here)

sum(3, "5") #=> nil
# OUTPUT:
#   Unknown

sum(nil, nil) #=> nil
# OUTPUT:
#   Unknown
