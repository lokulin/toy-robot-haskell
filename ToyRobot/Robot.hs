module ToyRobot.Robot where

import ToyRobot.Point
import ToyRobot.Table

data Robot = Robot { location :: Point
                   , facing :: Float
                   , table :: Table
                   } deriving (Show)

left :: Robot -> Robot
left robot = turn robot (-0.5)

right :: Robot -> Robot
right robot = turn robot 0.5

turn :: Robot -> Float -> Robot
turn (Robot loc facing table) amount = Robot loc (fmod (facing + amount) 2.0) table

move :: Robot -> Robot
move (Robot (Point x y) facing table) = Robot (Point (x + sin (pi * facing)) (y + cos (pi * facing))) facing table

fmod :: Float -> Float -> Float
fmod a b = a - b * fromIntegral(floor (a/b))
