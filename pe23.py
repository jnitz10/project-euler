from proper_divisors import proper_divs
from functools import lru_cache
import numpy as np 
import itertools  

nums = {x for x in range(1,28124)}
abundants = [x for x in nums if sum(list(proper_divs(x))) > x]
abundant_pairs = set((itertools.combinations_with_replacement(abundants, 2)))
abundant_pair_sums = {sum(x) for x in abundant_pairs}



print(sum(nums-abundant_pair_sums))
