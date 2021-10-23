

digits = "123456789"

isPandigital :: String -> Bool
isPandigital nums = (length nums == 9) && (foldr (&&) True $ fmap (\x -> elem x nums) digits)

-- 39 * 186 = 7254
-- x * y = z
n :: [Int]
n = [1,2,3,4,5,6,7,8,9]

m :: [Int]
m = [0..9]

x :: [Int]
x = [a*10 + b | a <- m, b <- n, a /= b]

y :: [Int]
y = [a*1000 + b*100 + c*10 + d | a <- m , b <- n , c <- n, d <- n, a /= b, b /= c, a /= c, d /= a, d /= b, d /= c]

z :: [(Int, Int)]
z = [(c, d) | c <- x, d <- y]

a = filter (/= Nothing) (fmap check z)

-- a = 39
-- b = 186

check :: (Int, Int) -> Maybe Int
check (a, b) = if isPandigital ((show a) ++ (show b) ++ (show (a*b)))
              then Just (a*b)
            else
              Nothing
