module ToyRobot.Point where

data Point = Point { x :: Float
                   , y :: Float
                   } deriving (Show)

le :: Point -> Point -> Bool
le (Point x1 y1) (Point x2 y2) = (x1 <= x2) && (y1 <= y2)

ge :: Point -> Point -> Bool
ge (Point x1 y1) (Point x2 y2) = (x1 >= x2) && (y1 >= y2)
