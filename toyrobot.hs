{-# LANGUAGE BangPatterns #-}
import ToyRobot.Point
import ToyRobot.Table
import ToyRobot.Robot

import System.IO
import Text.Regex.TDFA
import Data.Maybe
import Data.List

theTable :: Maybe Table
theTable = Just (Table (Point 0 0) (Point 4 4))

directions :: [String]
directions = ["NORTH","EAST","SOUTH","WEST"]

placeRegex :: String
placeRegex = "^PLACE ([0-9]+),([0-9]+),(NORTH|EAST|SOUTH|WEST)$"

sendCommand :: Robot -> [Char] -> Robot
sendCommand robot "MOVE" = move robot
sendCommand robot "LEFT" = left robot
sendCommand robot "RIGHT" = right robot
sendCommand robot other  = do
  let (_,_,_,args) = (other =~ placeRegex :: (String,String,String,[String]))
  if (length args) > 0 then do
    let xx = read(args !! 0)::Float
    let yy = read(args !! 1)::Float
    let maybeIndex = (args !! 2) `elemIndex` directions
    case maybeIndex of
      Just f -> place robot (Point xx yy) ((fromIntegral f) / 2) theTable
      Nothing -> robot
  else do
    robot

execute :: Robot -> IO()
execute robot = do
    end <- isEOF
    if end
      then return ()
      else do
        command <- getLine
        if command == "REPORT" && isJust (table robot)
          then do
            putStrLn ((show (round (x (location robot)))) ++ ","
                        ++ (show (round (y (location robot)))) ++ ","
                        ++ (directions !! round ((facing robot)*2)))
            let !robotAcc = robot
            execute robotAcc
          else do
            putStr ""
            let !robotAcc = sendCommand robot command
            execute robotAcc

main :: IO()
main = do
    let robot = Robot (Point 0 0) 0 Nothing
    execute robot
