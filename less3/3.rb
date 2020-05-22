arr = [0, 1]
loop do
  index = arr[-2] + arr[-1]
  break if index > 100
  arr.push(index)
end
print arr