module ToyRobot.Table where

import ToyRobot.Point

data Table = Table Point Point deriving (Show)

allowsMoveTo :: Table -> Point -> Bool
allowsMoveTo (Table llc urc) loc
  | (llc `le` loc) && (urc `ge` loc) = True
  | otherwise = False

instance Eq Table where
  (Table llc1 urc1) == (Table llc2 urc2) = llc1 == llc2 && urc1 == urc2
