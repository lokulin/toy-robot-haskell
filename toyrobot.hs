{-# LANGUAGE BangPatterns #-}
import ToyRobot.Point
import ToyRobot.Table
import ToyRobot.Robot
import ToyRobot.Heading

import Text.Regex.TDFA
import System.IO
import Control.Monad

theTable :: Maybe Table
theTable = Just (Table (Point 0 0) (Point 4 4))

placeRegex :: String
placeRegex = "^ ([0-9]+),([0-9]+),(NORTH|EAST|SOUTH|WEST)$"
commandRegex :: String
commandRegex = "^(MOVE$|LEFT$|RIGHT$|PLACE)"

parseCommand :: String -> Robot -> Robot
parseCommand input = case parts of
  ["MOVE"] -> move
  ["LEFT"] -> left
  ["RIGHT"] -> right
  ["PLACE"] -> case argParts of
    [x,y,direction] -> place (Point (read x::Float) (read y::Float)) (headingFromStr direction) theTable
    _ -> id
    where(_,_,_,argParts) = rest =~ placeRegex :: (String,String,String,[String])
  _ -> id
  where(_,_,rest,parts) = input =~ commandRegex :: (String,String,String,[String])


transform :: Robot -> IO()
transform !robot = do
    end <- isEOF
    unless end $ do
        line <- getLine
        case line of
          "REPORT" -> putStr $ show robot
          _ -> putStr []
        transform $ parseCommand line robot

main :: IO()
main = transform robot
  where robot = Robot (Point 0 0) (Heading 0.0) Nothing
