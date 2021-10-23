

getDigits :: Integral a => a -> [a]
getDigits x
  | x `div` 10 == 0 = [x `mod` 10]
  | otherwise       = getDigits (x `div` 10) ++ [x `mod` 10]

numChain :: Int -> Int
numChain 1 = 1
numChain 89 = 89
numChain n = numChain . sum $ fmap (\x-> x*x) (getDigits n)
