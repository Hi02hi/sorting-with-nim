# Sorting with Nim

## Algorithms (to date)

1. Bubble Sort
2. Cocktail Sort

#### Notes:
- All benchmarks were made in a standard Repl.it ide, with ```-d:release``` and ```--opt:speed ``` 
- I ran these algorithms a **lot** to see their maximum speeds
- In addition to running these algorithms, I ran them with slight optimizations and then with parallel proccessing, with the flag ```--threads:on``` and the library Weave.

## Benchmarks

| Algorithm | 10K Elements | 100K Elements | 1M Elements |
| --- | --- | --- | --- |
| Bubble Sort | ~0.72 secs | ~72 secs, or 1.2 mins | By this estimate,  7200 secs, or 2 hours|
| Bubble Sort Optimized | ~0.31 secs | ~37 secs, or 2.5 mins | By this estimate, 4181 secs, or  1.2 hours |
| Parallel Bubble Sort | ~0.09 secs | ~8.5 secs | By this estimate, 803 secs, or 13.4 mins |
| Cocktail Sort | ~0.50 secs | ~50 secs | By this estimate, 5000 secs, or 1.4 hours |
| Cocktail Sort Optimized | ~0.35 secs | ~40 secs | By this estimate, 4571 secs, or 1.27 hours |
| Parallel Cocktail Sort | ~0.115 secs (very unreliable) | ~9.5 secs (again, very unreliable) | By this estimate, 791 secs, or 13.2 mins |