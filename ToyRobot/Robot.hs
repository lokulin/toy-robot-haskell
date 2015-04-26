module ToyRobot.Robot (left, right, move) where

left :: Float -> Float
left facing = fmod (facing - 0.5) 2.0

right :: Float -> Float
right facing = fmod (facing + 0.5) 2.0

move :: Float -> Float -> Float -> (Float, Float)
move x y facing = (x + sin (pi * facing), y + cos (pi * facing))

fmod :: Float -> Float -> Float
fmod a b = a - b * fromIntegral(floor (a/b))
