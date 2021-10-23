
import Data.Set

x = takeWhile (<100) [n^2 | n <- [2..]]
y = takeWhile (<100) [n^3 | n <- [2..]]
z = takeWhile (<100) [n^4 | n <- [2..]]

base = [2..100]
exps = [2..100]
nums = [(a,b) | a <- base , b <- exps]

repeats = [expEq a b | a <- nums, b <- nums, expEq a b == True]

expEq :: (Float, Float) -> (Float, Float) -> Bool
expEq (b1, e1) (b2, e2) = if (b1, e1) == (b2, e2)
                            then True
                          else
                            logBase b1 b2 /= e1 / e2


nums2 = [(a, b) | a <- [2..10] :: [Float], b <- exps]

isUnique :: (Float, Float) -> Bool
isUnique x = Prelude.foldr (&&) True $ fmap (expEq x) nums
