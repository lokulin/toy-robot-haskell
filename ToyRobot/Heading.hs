module ToyRobot.Heading where

import ToyRobot.Point
import Data.List
import Data.Fixed

type Angle = Float
type Vector = Point
data Heading = Heading { alpha :: Angle }
data Rotation = ToLeft | ToRight

directions :: [String]
directions = ["NORTH","EAST","SOUTH","WEST"]

vector :: Heading -> Vector
vector (Heading angle) = Point (sin (angle * pi)) (cos (angle * pi))

moveTo :: Point -> Heading -> Point
moveTo location heading = location `plus` vector heading

rotate :: Heading -> Rotation -> Heading
rotate (Heading a) rotation = case rotation of
  ToLeft -> Heading ((a - 0.5) `mod'` 2)
  ToRight -> Heading ((a + 0.5) `mod'` 2)

headingFromStr :: String -> Heading
headingFromStr direction = case direction `elemIndex` directions of
      Just f -> Heading (fromIntegral f / 2)
      Nothing -> Heading 0.0

instance Show Heading where
  show (Heading a) = directions !! round (2 * a)
