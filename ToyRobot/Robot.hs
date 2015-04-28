module ToyRobot.Robot where

import ToyRobot.Point
import ToyRobot.Table
import Data.Maybe
import Data.Fixed

data Robot = Robot { location :: Point
                   , facing :: Float
                   , table :: Maybe Table
                   } deriving (Show)

_90_degrees_left :: Float
_90_degrees_left = (-0.5)

_90_degrees_right :: Float
_90_degrees_right = (0.5)

left :: Robot -> Robot
left robot = turn robot _90_degrees_left

right :: Robot -> Robot
right robot = turn robot _90_degrees_right

turn :: Robot -> Float -> Robot
turn robot angle =
  let (Robot loc facing table) = robot
  in place robot loc ((facing + angle) `mod'` 2.0) table

move :: Robot -> Robot
move robot =
  let (Robot loc facing table) = robot
  in place robot (loc `plus_vector_from_angle` facing) facing table

place :: Robot -> Point -> Float -> Maybe Table -> Robot
place robot loc facing table
  | (isJust table) && (table `allows_move_to` loc) = Robot loc facing table
  | otherwise = robot
