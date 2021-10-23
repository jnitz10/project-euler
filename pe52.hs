import Data.List (sort)

isAnagram :: Int -> Int -> Bool
isAnagram x y = (sort (show x)) == (sort (show y))

permCheck :: Int -> Bool
permCheck num = foldr (&&) True $ fmap (\x -> isAnagram num (num * x)) [2..6]

answer = take 1 [ n | n <-[1..], permCheck n]
