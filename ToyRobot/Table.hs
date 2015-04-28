module ToyRobot.Table where

import ToyRobot.Point

data Table = Table { llc :: Point
                   , urc :: Point
                   } deriving (Show)

allows_move_to :: Maybe Table -> Point -> Bool
allows_move_to (Just (Table llc urc)) loc
  | (llc `le` loc) && (urc `ge` loc) = True
  | otherwise = False

