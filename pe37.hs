import Data.Numbers.Primes

primesList :: [Int]
primesList = takeWhile (<1000000) primes

goodNums = "1379"

noDoubles :: String -> Bool
noDoubles [] = True
noDoubles (x:xs)
  | xs == [] = True
  | x == head xs = False
  | x /= head xs = noDoubles xs

noLeadDoubles :: String -> Bool
noLeadDoubles [] = True
noLeadDoubles (x:xs)
  | xs == []                  = True
  | x == head xs              = False
  | head (reverse (x:xs)) == head (tail (reverse (x:xs))) = False
  | otherwise                 = True


isValid :: String -> Bool
isValid s = foldr (&&) True $ fmap (\x -> elem x goodNums) s


candidatePrimes :: [String]
candidatePrimes = filter (\x -> isValid x && noLeadDoubles x) $ fmap show primesList


isLTruncatable :: String -> Bool
isLTruncatable [] = True
isLTruncatable (x:xs)
  | xs == []                 = True
  | isPrime (read xs :: Int) = isLTruncatable xs
  | otherwise                = False

isRTruncatable :: String -> Bool
isRTruncatable [] = True
isRTruncatable x
  | length x == 1 = True
  | isPrime ((read (init x)) :: Int) = isRTruncatable $ init x
  | otherwise                      = False

-- remove 3 and 7 from resulting list, add 23 and 53
solveList :: [String]
solveList = filter (\x -> isLTruncatable x && isRTruncatable x) candidatePrimes
