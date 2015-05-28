module ToyRobot.Point where

import Data.Number.CReal

data Point = Point CReal CReal

le :: Point -> Point -> Bool
le (Point x1 y1) (Point x2 y2) = (x1 <= x2) && (y1 <= y2)

ge :: Point -> Point -> Bool
ge (Point x1 y1) (Point x2 y2) = (x1 >= x2) && (y1 >= y2)

plus :: Point -> Point -> Point
plus (Point x1 y1) (Point x2 y2) = Point (x1 + x2) (y1 + y2)

instance Show Point where
  show (Point x y) = show x ++ "," ++ show y

instance Eq Point where
  (Point x y) == (Point xx yy) = x == xx && y == yy
