letters = ['a', 'e', 'i', 'o', 'u', 'y']
numbers = [1, 5, 9, 15, 21, 25]

l = 0
n = 0

procedure = {}

loop do
  procedure[letters[l]] = numbers[n]
  l += 1
  n += 1
  break if n > 6
end

print procedure.compact