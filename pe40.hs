

-- f(n) = how many digits integer n takes up in decimal fraction
f :: Float -> Float
f x = logBase 10 (x + 1)


x = [1..400000]

y = concat $ fmap show x

d :: Char -> Int
d n = read [n]

z = fmap d y
