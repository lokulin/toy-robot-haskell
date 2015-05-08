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
placeRegex = " ([0-9]+),([0-9]+),(NORTH|EAST|SOUTH|WEST)$"
commandRegex :: String
commandRegex = "(MOVE|LEFT|RIGHT|PLACE)(.*)"

parseCommand :: Robot -> String -> Robot
parseCommand robot input = case b:parts of
  [[],"MOVE",[]] -> move robot
  [[],"LEFT",[]] -> left robot
  [[],"RIGHT",[]] -> right robot
  [[],"PLACE",rest] -> case a:argParts of
    [[],x,y,direction] -> place robot (Point (read x::Float) (read y::Float)) (headingFromStr direction) theTable
    _ -> robot
    where(_,_,a,argParts) = rest =~ placeRegex :: (String,String,String,[String])
  _ -> robot
  where(b,_,_,parts) = input =~ commandRegex :: (String,String,String,[String])


transform :: Robot -> IO()
transform !robot = do
    end <- isEOF
    unless end $ do
        line <- getLine
        case line of
          "REPORT" -> putStr $ show robot
          _ -> putStr []
        transform $ parseCommand robot line

main :: IO()
main = transform robot
  where robot = Robot (Point 0 0) (Heading 0.0) Nothing
