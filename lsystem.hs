
import Control.Monad


data Lsys = A | B deriving (Eq, Show)

lRules :: Lsys -> [Lsys]
lRules A = [B]
lRules B = [A, B]

lTree :: Int -> [Lsys] -> [Lsys]
lTree 0 l = l
lTree n l = lTree (n-1) (l >>= lRules)
