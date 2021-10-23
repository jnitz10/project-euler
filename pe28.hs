
import qualified Data.Map as Map
import Prelude hiding (lookup)
import Data.Numbers.Primes






a :: [Int]
a = [-999 , -997..999]
b :: [Int]
b = (fmap (* (-1)) (takeWhile (<1000) primes)) ++ (takeWhile (<1000) primes)

coefficients = [(x, y) | x <- a, y <- b]



func :: (Int, Int) -> [Int]
func z = takeWhile (isPrime . abs) [x^2 + (fst z) * x + (snd z) | x <- [0..]]

results = fmap func coefficients

lengths = fmap length results

maxLength = maximum lengths


pairs = zip lengths coefficients

pairsMap = Map.fromList pairs
