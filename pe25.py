
cache = {}    
def fib(n):
    if n not in cache.keys():
        cache[n] = _fib(n)
    return cache[n]

def _fib(n):
    if n < 2:
        return n
    else:
        return fib(n-1) + fib(n-2)

def getlen(n):
    return len(str(fib(n)))

i = 0
while getlen(i) < 1000:
    i += 1

print(i)