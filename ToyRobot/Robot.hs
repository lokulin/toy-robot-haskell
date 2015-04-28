module ToyRobot.Robot where

import ToyRobot.Point
import ToyRobot.Table
import Data.Maybe

data Robot = Robot { location :: Point
                   , facing :: Float
                   , table :: Maybe Table
                   } deriving (Show)

left :: Robot -> Robot
left robot = turn robot (-0.5)

right :: Robot -> Robot
right robot = turn robot 0.5

turn :: Robot -> Float -> Robot
turn (Robot loc facing table) amount = Robot loc (fmod (facing + amount) 2.0) table

move :: Robot -> Robot
move robot =
  let (Robot (Point x y) facing table) = robot
  in place robot (Point (x + sin (pi * facing)) (y + cos (pi * facing))) facing table

place :: Robot -> Point -> Float -> Maybe Table -> Robot
place robot loc facing table
  | (isJust table) && (contains table loc) = Robot loc facing table
  | otherwise = robot

fmod :: Float -> Float -> Float
fmod a b = a - b * fromIntegral(floor (a/b))
