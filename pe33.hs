
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

facDigits = [factorial n | n <- [0..9]]

facStrings = fmap show facDigits
