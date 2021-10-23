
module Problem22 where

import System.IO
import Data.String
import Data.List
import Data.Char

names :: IO String
names = do
  l <- readFile "p022_names.txt"
  return l



y = filter (/= '\"')

z = fmap sort $ fmap words $ fmap toSpace $ fmap y names

toSpace :: String -> String
toSpace [] = []
toSpace (x:xs)
  | x == ',' = " " ++ (toSpace xs)
  | otherwise = [x] ++ (toSpace xs)

alphabeticalValue :: String -> Int
alphabeticalValue [] = 0
alphabeticalValue (x : xs) =
  ((ord . toLower $ x) - 96) + alphabeticalValue xs

nameVals = (fmap . fmap) alphabeticalValue z

score :: Int -> [Int] -> [Int]
score _ [] = []
score y (x : xs) =
  [x * y] ++ score (y + 1) xs

scoreSum = fmap sum $ fmap (score 1) nameVals
