import Data.Numbers.Primes

oddComposites :: [Int]
oddComposites = [n | n <-[9,11..], isPrime n == False]

doubleSquares :: [Int]
doubleSquares = [2 * n * n| n<-[1..]]


valid :: Int -> Bool
valid n = undefined

goldbach :: Int -> Bool
goldbach n = length x == 0
  where x = [(a, b) | a <- takeWhile (<n) primes, b <- takeWhile (<n) doubleSquares, a + b == n]

answer = head $ take 1 [n | n <- oddComposites, goldbach n == True]


