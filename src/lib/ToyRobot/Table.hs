module ToyRobot.Table where

import ToyRobot.Point

data Table = Table Point Point deriving (Show)

allowsMoveTo :: Table -> Point -> Bool
allowsMoveTo (Table llc urc) loc
  | (llc `le` loc) && (urc `ge` loc) = True
  | otherwise = False
