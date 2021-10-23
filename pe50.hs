import Data.Numbers.Primes

primes' :: [Int]
primes' = takeWhile (\x -> sum (takeWhile (<= x) primes) < 1000000) primes

primeSums :: [Int]
primeSums = [ sum $ take n primes| n<-[1..600]]
primeSums' = reverse primeSums

-- take list of primes with sum > 1000000 and subtract primes in order until < 1000000
-- return largest prime < 1000000
-- answer :: [Int] -> Int -> Int
-- answer nums n = answer nums
--   where answer 


findNum :: [Int] -> Int -> Int
findNum [] n = n
findNum (x:xs) n
  | n - x > 1000000 = findNum xs (n - x)
  | n - x < 1000000 = 
