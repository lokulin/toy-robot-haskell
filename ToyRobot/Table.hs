module ToyRobot.Table where

import ToyRobot.Point

data Table = Table { llc :: Point
                   , urc :: Point
                   } deriving (Show)

