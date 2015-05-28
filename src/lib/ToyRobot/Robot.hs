module ToyRobot.Robot where

import ToyRobot.Point
import ToyRobot.Table
import ToyRobot.Heading
import Data.Maybe

data Robot = Robot Point Heading (Maybe Table)

left :: Robot -> Robot
left robot = turn robot ToLeft

right :: Robot -> Robot
right robot = turn robot ToRight

turn :: Robot -> Rotation -> Robot
turn robot direction = place location (rotate heading direction) table robot
  where Robot location heading table = robot

move :: Robot -> Robot
move robot = place (location `moveTo` heading) heading table robot
  where Robot location heading table = robot

place :: Point -> Heading -> Maybe Table -> Robot -> Robot
place _ _ Nothing robot = robot
place location heading (Just table) robot
  | table `allowsMoveTo` location = Robot location heading (Just table)
  | otherwise = robot

instance Show Robot where
  show (Robot location heading table)
    | isJust table = show location ++ "," ++ show heading ++ "\n"
    | otherwise = []

instance Eq Robot where
  (Robot p1 h1 t1) == (Robot p2 h2 t2) = p1 == p2 && h1 == h2 && t1 == t2
