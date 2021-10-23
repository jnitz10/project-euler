-- a collection of useful project euler functions
module ProjectEuler where



factorial :: (Num a, Eq a) => a -> a
factorial 0 = 1
factorial n = n * (factorial (n - 1))

getDigits :: Integral a => a -> [a]
getDigits x
  | x `div` 10 == 0 = [x `mod` 10]
  | otherwise       = getDigits (x `div` 10) ++ [x `mod` 10]

insertionSort :: Ord a => [a] -> [a]
insertionSort [] = []
insertionSort [x] = [x]
insertionSort (x:xs) = insert $ insertionSort xs
    where insert [] = [x]
          insert (y:ys)
              | x < y = x : y : ys
              | otherwise = y : insert ys

isAnagramSmall :: Ord a => [a] -> [a] -> Bool
isAnagramSmall x y = (insertionSort x) == (insertionSort y)

isPalindrome :: String -> Bool
isPalindrome x = x == reverse x


isPandigital :: String -> Bool
isPandigital nums = (length nums == 9) && (foldr (&&) True $ fmap (\x -> elem x nums) "123456789")
