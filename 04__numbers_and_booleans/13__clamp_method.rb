# Notes:
#   * .clamp - clamps (limits) an object within a specific range of values

# Docs:
#   * https://apidock.com/ruby/Comparable/clamp

12.clamp(0, 100)     #=> 12
523.clamp(0, 100)    #=> 100

-3.123.clamp(0, 100) #=> 0

'd'.clamp('a', 'f') #=> 'd'
'z'.clamp('a', 'f') #=> 'f'
