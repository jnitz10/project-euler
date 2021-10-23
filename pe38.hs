
digits = "123456789"

isPandigital :: String -> Bool
isPandigital nums = (length nums == 9) && (foldr (&&) True $ fmap (\x -> elem x nums) "123456789")

getProds :: Int -> [Int]
getProds n
  | n >= 500 = fmap (*n) [1,2]
  | n >= 100 = fmap (*n) [1..3]
  | n >= 25  = fmap (*n) [1..4]
  | n >= 5   = fmap (*n) [1..5]
  | otherwise = [0]

nums = fmap getProds [1..9999]

toText :: [Int] -> String
toText x = concat $ fmap show x
