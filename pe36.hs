import Numeric (showIntAtBase)
import Data.Char (intToDigit)


isPalindrome :: String -> Bool
isPalindrome w = w == reverse w

getBinary :: Int -> String
getBinary n = showIntAtBase 2 intToDigit n ""

x :: [String]
x = filter isPalindrome $ fmap show [1,3..999999]

isBinPalindrome :: String -> Bool
isBinPalindrome n = num == reverse num
  where num = getBinary (read n :: Int)



