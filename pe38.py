
digits = "123456789"

isPandigital :: String -> Bool
isPandigital nums = (length nums == 9) && (foldr (&&) True $ fmap (\x -> elem x nums) digits)

getProds :: Int ->
