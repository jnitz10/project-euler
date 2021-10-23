
import Data.Numbers.Primes


-- list of primes below 1,000,000
primesList :: [Int]
primesList = takeWhile (<1000000) primes

-- turnes a number into a list of rotations of that number
makeCircles :: Int -> [Int]
makeCircles a = fmap read (subStrings (length (show a)) (formatNumString (show a)))

-- the only digits that circular primes contain
goodNums = "1379"

-- checks if a number in the form of a string only
-- contains the digits found in circular primes
isValid :: String -> Bool
isValid s = foldr (&&) True $ fmap (\x -> elem x goodNums) s

-- generates a list of possible circular primes
validPrimesList :: [Int]
validPrimesList = fmap read $ filter isValid (fmap show primesList)

-- numToString :: Int -> String
-- numToString n = init $ (show n) ++ (show n)

formatNumString :: String -> String
formatNumString n = init $ n ++ n

-- splits a string into all possible substrings
-- of length n
subStrings :: Int -> String -> [String]
subStrings n [] = []
subStrings n s
  | n > length s = [
  | n == 0  = []
  | n < 0   = []
  | otherwise = (take n s) : (subStrings n (tail s))

-- checks if a list only contains primes
allPrimes :: [Int] -> Bool
allPrimes nums = foldr (&&) True $ fmap isPrime nums

solve :: [Int] -> [Int]
solve [] = []
solve (n:ns)
  | allPrimes (makeCircles n) == True = n : solve(ns)
  | otherwise                         = solve(ns)

answer = length $ solve validPrimesList
