import random, times, parseopt, strutils, weave
# When compiling, attach a number on the end to say how many random elements you want to sort

let cmdline = initOptParser("")
let amount = cmdline.remainingArgs[0].parseInt

var nums = newSeq[int](amount)

randomize()

echo "Starting Bubble Sort..."
let start = cpuTime()

init(Weave)

for i in 0 ..< amount: nums[i] = rand(1..amount*8)

proc swap(nums: ptr seq[int], a,b: int) = 
  let temp = nums[a]
  nums[a] = nums[b]
  nums[b] = temp

proc sort(nums: ptr seq[int]) = 
  parallelFor a in 0 .. amount:
    captures: {nums}
    for b in 1 ..< amount-a:
      if nums[b] < nums[b-1]: swap(nums, b, b-1)

sort(addr(nums))

exit(Weave)

let duration = cpuTime() - start
echo amount, " elements were sorted in \n", duration, " seconds"