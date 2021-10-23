

-- a = m^2 - n^2
-- b = 2mn
-- c = m^2 + n^2

-- p = a + b + c
-- p = 2m^2 + 2mn

getNums :: Int -> [(Int, Int, Int)]
getNums p = [(m, n, (2 * m^2 + 2 * m * n)) | m <- [1..p `div` 2], n <- [1..p `div` 2], p == (2*m*m) + (2 * m * n)]

nums = fmap getNums [1..1000]




pytrip :: Int -> [(Int, Int, Int)]
pytrip n =
  filter
    (\(a, b, c) -> a + b + c <= n)
    [ (a, b, c)
    | a <- xs
    , b <- drop a xs
    , c <- drop b xs
    , a ^2 + b ^ 2 == c ^ 2 ]
  where
    xs = [1..n]

getP :: (Int, Int, Int) -> Int
getP (a, b, c) = a + b + c
