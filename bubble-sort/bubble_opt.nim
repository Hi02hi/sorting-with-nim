import random, times, parseopt, strutils
# When compiling, attach a number on the end to say how many random elements you want to sort

onFailedAssert(msg):
  echo "\lYou must say how many elements you want to sort in the command line"
  quit(1)

let cmdline = initOptParser("")
assert len(cmdline.remainingArgs) > 0
let amount = cmdline.remainingArgs[0].parseInt

proc swap(nums: var seq[int], a,b: int) {.inline.} = 
  let temp = nums[a]
  nums[a] = nums[b]
  nums[b] = temp

proc bubble_sort(nums:var seq[int]) = 
  for a in 1 ..< amount:
    for b in 1 ..< amount-a: #This is the only difference between the two files
      if nums[b] < nums[b-1]: swap(nums, b, b-1)

echo "Starting Bubble Sort..."
let start = cpuTime()

var nums = newSeq[int](amount)

randomize()

for i in 0 ..< amount: nums[i] = rand(1..amount*8)



bubble_sort(nums)

let duration = cpuTime() - start

echo amount, " elements were sorted in \n", duration, " seconds"