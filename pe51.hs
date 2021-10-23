import Data.Numbers.Primes
import Data.List (permutations)

{-
1. turn prime into string
2. generate strings based off of possible replacements
   (replace digits with x)
3. turn base strings into lists of numbers
4. remove non-prime numbers-}


getDigits :: Integral a => a -> [a]
getDigits x
  | x `div` 10 == 0 = [x `mod` 10]
  | otherwise       = getDigits (x `div` 10) ++ [x `mod` 10]




getDiff :: [Int] -> [Int] -> Int
getDiff = undefined

func :: [Int] -> [(Int -> Bool)] -> [Bool]
func _ [] = []
func [] _ = []
func (x:xs) (f:fs) = [f x] ++ func xs fs

fac :: Int -> Int
fac 0 = 1
fac n = n * (fac (n-1))

getNums :: String -> [String]
getNums str = [fmap (\x -> if x == 'x' then head $ show n else x) str | n <-[0..9]]

comb :: Int -> [Int] -> [[Int]]
comb m xs = combsBySize xs !! m
  where
    combsBySize = foldr f ([[]] : repeat [])
    f x next = zipWith (++) (map (map (x:)) ([]:next)) next

numToRep :: [Int] -> String -> String
numToRep [] str = str
numToRep (x:xs) str = numToRep xs $ (take x str) ++ "x" ++ drop (x+1) str

noLeading0 :: String -> Bool
noLeading0 [] = True
noLeading0 (x:xs) = if x == '0' then False else True

minLength :: [String] -> ([String], Int)
minLength xs = ( fmap show (filter isPrime (fmap read xs')), length (filter isPrime (fmap read xs')))
  where xs' = filter noLeading0 xs

reps :: Int -> [Int] -> [[Int]]
reps 0 _ = []
reps n xs = comb n xs ++ reps (n-1) xs

getReps :: Int -> [[Int]]
getReps n = reps ((length $ show n)-1) [0..(length $ show n) - 2]

reps7 = getReps 1000000

reps6 = getReps 100000

reps5 = getReps 10000

reps4 = getReps 1000

-- filter (\x -> (isPrime $ fst x) == True) xs

getPossibleReps :: Int -> [String]
getPossibleReps n
  | length (show n) == 7 = fmap (\x -> numToRep x (show n)) reps7
  | length (show n) == 6 = fmap (\x -> numToRep x (show n)) reps6
  | length (show n) == 5 = fmap (\x -> numToRep x (show n)) reps5
  | length (show n) == 4 = fmap (\x -> numToRep x (show n)) reps4
  | otherwise = []


primes' :: [Int]
primes' = dropWhile (< 1000) $ takeWhile (< 1000000) primes


primes'' = fmap getPossibleReps primes'

x = (fmap . fmap) getNums primes''
x' = (fmap . fmap) minLength x
z = fmap (filter (\x -> ((snd x) > 7) == True)) x'
z' = filter (/= []) z
answer = head . fst . head . concat $ take 1 z'

