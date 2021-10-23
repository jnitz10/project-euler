

-- 354294

getDigits :: Int -> [Int]
getDigits x
  | x `div` 10 == 0 = [x]
  | otherwise = getDigits (x `div` 10) ++ [x `mod` 10]

isRight :: Int -> Bool
isRight x = x == sum (fmap (\x -> x ^ 5) (getDigits x))

nums = [n | n <- [2..400000] , isRight n == True]
