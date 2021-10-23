import Math.NumberTheory.Primes

countPrimeFacs :: (Integral a, UniqueFactorisation a) => a -> Int
countPrimeFacs = length . factorise

consecs :: Int -> Int
consecs n
  | countPrimeFacs n /= countPrimeFacs (n+1) = 1
  | countPrimeFacs n == countPrimeFacs (n+1) = 1 + consecs (n+1)

answer = take 1 [ n | n<-[647..], countPrimeFacs n == 4, consecs n == 4]
