import random, times, parseopt, strutils, weave

let 
  cmdline = initOptParser("")
  amount = cmdline.remainingArgs[0].parseInt

var
  nums = newSeq[int](amount)

proc swap(nums: ptr seq[int], a, b: int) = 
  let temp = nums[a]
  nums[a] = nums[b]
  nums[b] = temp

proc cocktail_sort(nums: ptr seq[int]) = 
  parallelFor a in 0 .. amount div 2:
    captures: {nums}
    var sorted = true
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

init(Weave)

for i in 0 ..< amount: nums[i] = rand(1..amount*8)

cocktail_sort(addr(nums))

exit(Weave)

let duration = cpuTime() - start

echo amount, " elements were sorted in \l", duration, " seconds"