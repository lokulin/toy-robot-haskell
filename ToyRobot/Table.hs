module ToyRobot.Table where

import ToyRobot.Point

data Table = Table { llc' :: Point
                   , urc' :: Point
                   } deriving (Show)

allowsMoveTo :: Maybe Table -> Point -> Bool
allowsMoveTo (Just (Table llc urc)) loc
  | (llc `le` loc) && (urc `ge` loc) = True
  | otherwise = False
allowsMoveTo Nothing _ = False
