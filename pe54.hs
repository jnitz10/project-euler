
data CardVal = Two | Three | Four
  | Five | Six | Seven | Eight
  | Nine | Ten | Jack | Queen
  | King | Ace
  deriving (Eq, Show, Enum, Ord)

data Suit = H | D | C | S deriving (Eq, Show, Enum, Ord, Read)

data Card = Card CardVal Suit deriving (Eq, Show, Ord)
             
             
