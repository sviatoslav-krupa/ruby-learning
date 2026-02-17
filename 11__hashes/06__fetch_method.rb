# Docs:
#   * https://ruby-doc.org/3.4.1/Hash.html#method-i-fetch

menu = {
  burger: 3.99,
  taco: 5.96,
  chips: 0.5
}

menu[:taco]                       #=> 5.96
menu.fetch(:taco)                 #=> 5.96
menu.fetch(:taco, "Wrong option") #=> 5.96

menu[:salad]                        #=> nil
menu.fetch(:salad)                  #=> key not found: :salad (KeyError)
menu.fetch(:salad, "Wrong option")  #=> "Wrong option"
menu.fetch(:salad, nil)             #=> nil (like `menu[:salad]`)

# Edge cases:
class ExpensiveOperation
  def self.perform(name)
    puts "Searching for user #{name}..."
    search_length = sleep 5
    puts "Search complete after #{search_length} seconds."
    puts "No user found"
  end
end

user_hash = { john: "John Doe" }

# Using || operator (lazy evaluation):
user_hash[:john] || ExpensiveOperation.perform(:john) #=> "John Doe"
user_hash[:paul] || ExpensiveOperation.perform(:paul) #=> nil
# OUTPUT:
#   Searching for user paul...
#   Search complete after 5 seconds.
#   No user found

# Using .fetch method with second argument (second argument is evaluated EVEN if the key exists):
user_hash.fetch(:john, ExpensiveOperation.perform(:john)) #=> "John Doe"
# OUTPUT:
#   Searching for user john...
#   Search complete after 5 seconds.
#   No user found
user_hash.fetch(:paul, ExpensiveOperation.perform(:paul)) #=> nil
# OUTPUT:
#   Searching for user paul...
#   Search complete after 5 seconds.
#   No user found

# Using .fetch method with block (block is evaluated only if the key doesn't exist):
user_hash.fetch(:john) { ExpensiveOperation.perform(:john) } #=> "John Doe"
user_hash.fetch(:paul) { ExpensiveOperation.perform(:paul) } #=> nil
# OUTPUT:
#   Searching for user paul...
#   Search complete after 5 seconds.
#   No user found
