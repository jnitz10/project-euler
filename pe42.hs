import System.IO
import Control.Monad
import Data.String
import Data.List
import Data.Char


names :: IO String
names = do
  l <- readFile "p042_words.txt"
  return l

y = filter (/= '\"')

z = fmap sort $ fmap words $ fmap toSpace $ fmap y names


toSpace :: String -> String
toSpace [] = []
toSpace (x:xs)
  | x == ',' = " " ++ (toSpace xs)
  | otherwise = [x] ++ (toSpace xs)


abc = ['A'..'Z']

alphabeticalValue :: String -> Int
alphabeticalValue [] = 0
alphabeticalValue (x : xs) =
  ((ord . toLower $ x) - 96) + alphabeticalValue xs

nameVals = (fmap . fmap) alphabeticalValue z

triangularNums :: [Int]
triangularNums = [n * (n + 1) `div` 2 | n <- [1..100]]

answer = fmap length (fmap (filter(\x -> elem x triangularNums)) nameVals)
