module ToyRobot.Table where

import ToyRobot.Point

data Table = Table { llc :: Point
                   , urc :: Point
                   } deriving (Show)

contains :: Maybe Table -> Point -> Bool
contains (Just (Table llc urc)) loc
  | (llc `le` loc) && (urc `ge` loc) = True
  | otherwise = False

