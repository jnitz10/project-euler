import Prelude hiding (lookup)
import Data.Numbers.Primes
import Data.List (sort, permutations, nub)
import ProjectEuler
import Data.Monoid

-- (Int , [Int])

leastAngrm :: Int -> Int
leastAngrm = read . concat . fmap show . sort . getDigits

isAnagram :: Int -> Int -> Bool
isAnagram i j = (sort . getDigits $ i) == (sort .getDigits $ j)

primeList :: [Int]
primeList = dropWhile (<1000) . takeWhile (<10000) $ primes

primeAngrms :: Int -> [Int]
primeAngrms = filter ((&&) <$> isPrime <*> (>1000)) . sort . fmap read . permutations . show


primes' = nub [ (leastAngrm x, sort . nub . primeAngrms $ x) | x <- primeList]

primes'' = filter (\x -> length (snd x) > 2) primes'

func :: [Int] -> [Int]
func [] = []
func (x:xs)
  | xs == [] = []
  | abs (x - (head xs)) == 3330 = [x] ++ [head xs] ++ func xs
  | otherwise = func xs



