

isPalindrome :: Integer -> Bool
isPalindrome n = reverse (show n) == (show n)

palindromeGen :: Integer -> Integer
palindromeGen n = n + ((read $ reverse (show n)):: Integer)


isLychrel :: Integer -> Bool
isLychrel n = lych (palindromeGen n) 48
  where lych _ 0 = True
        lych n x = if isPalindrome n then False else lych (palindromeGen n) (x - 1)

lychrels = [ x | x<-[1..9999], isLychrel x]

answer = length lychrels

