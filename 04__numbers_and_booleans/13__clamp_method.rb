# Notes:
#   * .clamp - returns min if obj <=> min is less than zero, max if obj <=> max is greater than zero and obj otherwise

# Docs:
#   * https://apidock.com/ruby/Comparable/clamp

12.clamp(0, 100)     #=> 12
523.clamp(0, 100)    #=> 100

-3.123.clamp(0, 100) #=> 0

'd'.clamp('a', 'f') #=> 'd'
'z'.clamp('a', 'f') #=> 'f'
