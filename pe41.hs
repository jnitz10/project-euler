
import Data.Numbers.Primes



isPandigital :: Int -> Bool
isPandigital nums = (foldr (&&) True $ fmap (\x -> elem x (show nums)) (getNumDigits nums))


getNumDigits :: Int -> String
getNumDigits n = concat $ fmap show [1..length $ show n]




