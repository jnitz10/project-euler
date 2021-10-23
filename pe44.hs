import Math.NumberTheory.Powers.Squares


pentagonals :: [Int]
pentagonals = [(n*((3*n) - 1) `div` 2) | n<-[1..1000]]

pentagonals' :: [Int]
pentagonals' = [pent' n | n<-[1,3..1000]]

pents = [pent n | n <- [1..100000]]
pents2 = fmap (*2) pents
pents' = [pent' n | n <- (fmap (\x -> 2 * x + 1)[1..100000])]


answerList = [ a - b | a <- pentagonals, b <- pentagonals, a /= b, (a + b) `elem` pentagonals, (a - b) `elem` pentagonals]

pent :: Int -> Int
pent x = ((3 * x * x) - x) `div` 2

pent' :: Int -> Int
pent' x = ((6 * x) - 1) `div` 4

pentIndex :: Int -> Int
pentIndex x =(integerSquareRoot(24 * x + 1) + 1) `div` 6

pentTest :: Int -> Bool
pentTest x = pent ((integerSquareRoot(24 * x + 1) + 1) `div` 6 ) == x

possibleD :: [Int]
possibleD = [n | n <-[1..], pentTest (pent' n) == True]

i = take 2 [2 * (pent n) | n<-[1..], pentTest (2 * (pent n)) == True]


