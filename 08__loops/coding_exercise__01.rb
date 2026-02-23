# CHALLENGE: FizzBuzz

# FizzBuzz is a popular programming problem to test a developer's ability to think logically with code.

# Iterate from 1 to `number`.
# If the number is divisible by 3 - print 'Fizz'.
# If the number is divisible by 5 - print 'Buzz'.
# If the number is divisible by 3 and 5 - print 'FizzBuzz'.
# If the number is not divisible by either 3 or 5 - print the number.

def fizzbuzz(number)
  i = 1

  while i <= number
    if i % 3 == 0 && i % 5 == 0
      puts "FizzBuzz - #{i}"
    elsif i % 3 == 0
      puts "Fizz - #{i}"
    elsif i % 5 == 0
      puts "Buzz - #{i}"
    else puts i
    end

    i += 1
  end
end
fizzbuzz(25)
# OUTPUT:
#   1
#   2
#   Fizz - 3
#   4
#   Buzz - 5
#   Fizz - 6
#   7
#   8
#   Fizz - 9
#   Buzz - 10
#   11
#   Fizz - 12
#   13
#   14
#   FizzBuzz - 15
#   16
#   17
#   Fizz - 18
#   19
#   Buzz - 20
#   Fizz - 21
#   22
#   23
#   Fizz - 24
#   Buzz - 25

def fizzbuzz(number)
  1.upto(number) do |i|
    result = ""

    result << "Fizz" if i % 3 == 0
    result << "Buzz" if i % 5 == 0
    result << i.to_s if result.empty?

    puts result
  end
end
fizzbuzz(25) #=> 1
# OUTPUT:
#   1
#   2
#   Fizz
#   4
#   Buzz
#   Fizz
#   7
#   8
#   Fizz
#   Buzz
#   11
#   Fizz
#   13
#   14
#   FizzBuzz
#   16
#   17
#   Fizz
#   19
#   Buzz
#   Fizz
#   22
#   23
#   Fizz
#   Buzz
