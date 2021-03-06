module ToyRobot.Heading where

import ToyRobot.Point
import Data.List
import Data.Number.CReal

type Angle = CReal
type Vector = Point
data Heading = Heading Angle
data Rotation = ToLeft | ToRight

directions :: [String]
directions = ["NORTH","EAST","SOUTH","WEST"]

vector :: Heading -> Vector
vector (Heading heading) = Point (sin (heading * pi)) (cos (heading * pi))

moveTo :: Point -> Heading -> Point
moveTo location heading = location `plus` vector heading

rotate :: Heading -> Rotation -> Heading
rotate (Heading heading) ToLeft = Heading ((heading - 0.5) `fmod` 2.0)
rotate (Heading heading) ToRight = Heading ((heading + 0.5) `fmod` 2.0)

headingFromStr :: String -> Heading
headingFromStr direction = case direction `elemIndex` directions of
      Just f -> Heading (fromIntegral f / 2)
      Nothing -> Heading 0.0

fmod :: CReal -> CReal -> CReal
fmod a b = a - b * fromIntegral (floor (a / b))

instance Show Heading where
  show (Heading a) = directions !! round (2 * a)

instance Eq Heading where
  (Heading a) == (Heading b) = a == b
