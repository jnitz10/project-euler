
import Data.Map
import Prelude hiding (lookup)
import ProjectEuler

facDigits = fromList [(n, factorial n) | n <- [0..9]]

getDigitSum :: Int -> Maybe Int
getDigitSum x = fmap sum $ traverse (\n -> lookup n facDigits) (getDigits x)

noJust :: Maybe Int -> Int
noJust Nothing = 0
noJust (Just x) = x

facSums = fromList [(n, noJust  (getDigitSum n)) | n <- [3..5100000], n == (noJust (getDigitSum n))]

-- 4 9 9 9 9 9 9

