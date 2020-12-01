import random, times, parseopt, strutils

let 
  cmdline = initOptParser("")
  amount = cmdline.remainingArgs[0].parseInt

var
  nums = newSeq[int](amount)

echo "Starting Cocktail Sort..."
let start = cpuTime()

for i in 0 ..< amount: nums[i] = rand(1..amount*8)

proc swap(nums: var seq[int], a, b: int) = 
  let temp = nums[a]
  nums[a] = nums[b]
  nums[b] = temp

proc cocktail_sort(nums: var seq[int]) = 
  for i in 0 .. amount div 2:
    var sorted = true
    for i in countup(0, amount-2):
      if nums[i] > nums[i+1]:
        swap(nums, i, i+1)
        sorted = false
    if sorted: break
    else: sorted = true
    for i in countdown(amount-2, 0):
      if nums[i] > nums[i+1]:
        swap(nums, i, i+1)
        sorted = false
    if sorted: break

cocktail_sort(nums)

let duration = cpuTime() - start

echo amount, " elements were sorted in \l", duration, " seconds"