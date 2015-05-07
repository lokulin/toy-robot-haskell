module ToyRobot.Robot where

import ToyRobot.Point
import ToyRobot.Table
import ToyRobot.Heading
import Data.Maybe

data Robot = Robot { location' :: Point
                   , heading' :: Heading
                   , table' :: Maybe Table
                   }

left :: Robot -> Robot
left robot = turn robot ToLeft

right :: Robot -> Robot
right robot = turn robot ToRight

turn :: Robot -> Rotation -> Robot
turn robot direction = place robot location (rotate heading direction) table
  where Robot location heading table = robot

move :: Robot -> Robot
move robot = place robot (location `moveTo` heading) heading table
  where Robot location heading table = robot

place :: Robot -> Point -> Heading -> Maybe Table -> Robot
place robot location heading table
  | table `allowsMoveTo` location = Robot location heading table
  | otherwise = robot

instance Show Robot where
  show (Robot location heading table)
    | isJust table = show location ++ "," ++ show heading
    | otherwise = []

