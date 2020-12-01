import random, times, parseopt, strutils, weave
# When compiling, attach a number on the end to say how many random elements you want to sort

onFailedAssert(msg):
  echo "\lYou must say how many elements you want to sort in the command line"
  quit(1)

let cmdline = initOptParser("")
assert len(cmdline.remainingArgs) > 0
let amount = cmdline.remainingArgs[0].parseInt

var nums = newSeq[int](amount)

randomize()

# Change from a variable sequence to the pointer to a sequence
proc swap(nums: ptr seq[int], a,b: int) = 
  let temp = nums[a]
  nums[a] = nums[b]
  nums[b] = temp

# Another pointer to a sequence
proc bubble_sort(nums: ptr seq[int]) = 
  parallelFor a in 0 .. amount: # A parallel for loop
    captures: {nums}
    for b in 1 ..< amount-a:
      if nums[b] < nums[b-1]: swap(nums, b, b-1)

echo "Starting Parallel Bubble Sort..."
let start = cpuTime()

init(Weave)

for i in 0 ..< amount: nums[i] = rand(1..amount*8)


bubble_sort(addr(nums))

exit(Weave)

let duration = cpuTime() - start
echo amount, " elements were sorted in \n", duration, " seconds"