import Data.Monoid

isPandigital :: String -> Bool
isPandigital nums = (length nums == 9) && (foldr (&&) True $ fmap (\x -> elem x nums) "1234567890")

-- possibilities for each digit
d1 = [1..9]
d4 = [0,2..8]
d6 = [0, 5]

-- helper functions for list generation
merge3Str :: Int -> Int -> Int -> String
merge3Str x y z = concat $ fmap show [x,y,z]

merge3 :: Int -> Int -> Int -> Int
merge3 x y z = 100 * x + 10 * y + z

-- lists of possible digit groups
d234 = [merge3Str a b c | a <- [0..9],
        b <- [0..9], c <- d4, a /= b,
        b /= c, a /= c]

d1234 = [(show a) ++ b | a <- d1, b <- d234, elem (head $ show a) b == False]

d345 = [merge3Str a b c | a <- [0..9],
        b <- [0..9], c <- [0..9],
        a /= b, b /= c, a /= c,
        (merge3 a b c) `mod` 3 == 0]

d456 = [merge3Str a b c | a <- [0..9],
        b <- [0..9], c <- d6, a /= b,
        b /= c, a /= c]

d567 = [merge3Str a b c | a <- [0..9],
        b <- d6, c <- [0..9],
        a /= b, b /= c, a /= c,
        (merge3 a b c) `mod` 7 == 0]

d678 = [merge3Str a b c | a <- d6,
        b <- [0..9], c <- [0..9],
        a /= b, b /= c, a /= c,
        (merge3 a b c) `mod` 11 == 0]

d789 = [merge3Str a b c | a <- [0..9],
        b <- [0..9], c <- [0..9],
        a /= b, b /= c, a /= c,
        (merge3 a b c) `mod` 13 == 0]

d890 = [merge3Str a b c | a <- [0..9],
        b <- [0..9], c <- [0..9],
        a /= b, b /= c, a /= c,
        (merge3 a b c) `mod` 17 == 0]

mergeCheck :: Eq a => [a] -> [a] -> Bool
mergeCheck [] [] = False
mergeCheck a [] = True
mergeCheck a b
  | length a < 3 = False
  | length b < 3 = False
  | (last a) == (head . tail $ b) &&
    (last . init $ a) == head b  &&
    (last b) `notElem` a = True
  | otherwise    = False

masterList :: [[String]]
masterList = [d1234,d345,d456,d567,d678,d789,d890]


concatNum :: String -> String -> String
concatNum a b = undefined

allDifferent :: (Eq a) => [a] -> Bool
allDifferent list = case list of
  [] -> True
  (x:xs) -> x `notElem` xs && allDifferent xs
