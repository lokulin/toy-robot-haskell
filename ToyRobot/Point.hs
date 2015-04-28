module ToyRobot.Point where

data Point = Point { x :: Float
                   , y :: Float
                   } deriving (Show)

le :: Point -> Point -> Bool
le (Point x1 y1) (Point x2 y2) = (x1 <= x2) && (y1 <= y2)

ge :: Point -> Point -> Bool
ge (Point x1 y1) (Point x2 y2) = (x1 >= x2) && (y1 >= y2)

plus :: Point -> Point -> Point
plus (Point x1 y1) (Point x2 y2) = Point (x1 + x2) (y1 + y2)

plus_vector_from_angle :: Point -> Float -> Point
plus_vector_from_angle loc angle = loc `plus` (Point (sin (angle * pi)) (cos (angle * pi)))
