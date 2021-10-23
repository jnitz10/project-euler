odds = [n for n in range(1001) if n % 2 != 0]

def getcycle(n):
    """dividend = 1, divisor = n"""
    remainders = set() 
    rem = None
    quotient_digits = []
    dividend = 1
    while True:
        quotient_digits.append(dividend // n)
        rem = n * (dividend // n)
        dividend = (dividend - rem) * 10
        if dividend in remainders:
            return quotient_digits
        else:
            remainders.add(dividend)
    return quotient_digits
