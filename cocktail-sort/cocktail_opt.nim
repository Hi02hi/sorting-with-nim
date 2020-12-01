import random, times, parseopt, strutils

let 
  cmdline = initOptParser("")
  amount = cmdline.remainingArgs[0].parseInt

var
  sorted = false
  nums = newSeq[int](amount)

proc swap(nums: var seq[int], a, b: int) = 
  let temp = nums[a]
  nums[a] = nums[b]
  nums[b] = temp

proc cocktail_sort(nums: var seq[int]) = 
  for a in 0 .. amount div 2:
    sorted = true
    for b in countup(a, (amount-2)-a):
      if nums[b] > nums[b+1]:
        swap(nums, b, b+1)
        sorted = false
    if sorted: break
    else: sorted = true
    for c in countdown((amount-2)-a, a):
      if nums[c] > nums[c+1]:
        swap(nums, c, c+1)

echo "Starting Cocktail Sort..."
let start = cpuTime()

for i in 0 ..< amount: nums[i] = rand(1..amount*8)

cocktail_sort(nums)

let duration = cpuTime() - start

echo amount, " elements were sorted in \l", duration, " seconds"