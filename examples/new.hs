import Control.Monad
import Control.Monad.Distribution.Rational
import Data.List

data Coin = Heads | Tails
  deriving (Eq, Ord, Show)

toss :: (Dist d) => d Coin
toss = uniform [Heads, Tails]

tosses n = sequence (replicate 2 toss)

unorderedTosses n = liftM sort (tosses n)

{-

*Main> ddist (unorderedTosses 2)
[MV 1%4 [Heads,Heads],MV 1%2 [Heads,Tails],MV 1%4 [Tails,Tails]]

*Main> sampleIO (unorderedTosses 2) 10
[[Heads,Heads],[Heads,Heads],[Heads,Heads],[Tails,Tails],[Heads,Heads],[Heads,Heads],[Heads,Tails],[Heads,Tails],[Tails,Tails],[Heads,Tails]]

-}