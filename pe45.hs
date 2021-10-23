import Math.NumberTheory.Powers.Squares

tri :: Int -> Int
tri x = (x * (x + 1)) `div` 2

pent :: Int -> Int
pent x = ((3 * x * x) - x) `div` 2

hex :: Int -> Int
hex x  = x * (2 * x - 1)

triTest :: Int -> Bool
triTest x = tri ((integerSquareRoot(8 * x + 1) - 1) `div` 2 ) == x

triIndex :: Int -> Int
triIndex x =(integerSquareRoot(8 * x + 1) - 1) `div` 2

pentTest :: Int -> Bool
pentTest x = pent ((integerSquareRoot(24 * x + 1) + 1) `div` 6 ) == x

hexTest :: Int -> Bool
hexTest x = hex ((integerSquareRoot(8 * x + 1) + 1) `div` 4 ) == x
