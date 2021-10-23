

fac :: Double -> Double
fac 0 = 1
fac n = n * fac (n-1)

comb :: Double -> Double -> Double
comb n r = (fac n) / ((fac r) * (fac (n - r)))

combos :: [(Double, Double)]
combos = [(n,r) | n <-[23..100], r <-[1..100], r <= n, (comb n r) > 1000000]

answer = length combos
