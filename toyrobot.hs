{-# LANGUAGE BangPatterns #-}
import ToyRobot.Point
import ToyRobot.Table
import ToyRobot.Robot
import ToyRobot.Heading
import ToyRobot.Command

import System.IO
import Control.Monad

theTable :: Maybe Table
theTable = Just (Table (Point 0 0) (Point 4 4))

sendCommand :: Robot -> Command -> Maybe Args -> Robot
sendCommand robot MOVE _ = move robot
sendCommand robot LEFT _ = left robot
sendCommand robot RIGHT _ = right robot
sendCommand robot PLACE (Just (Args point heading)) = place robot point heading theTable
sendCommand robot _ _ = robot

execute :: Robot -> IO()
execute !robot = do
    end <- isEOF
    unless end $ do
        line <- getLine
        case parseCommand line of
          (Just REPORT, Nothing) -> print robot
          (Just command, args) -> execute $ sendCommand robot command args
          (Nothing, Nothing) -> execute robot
          _ -> execute robot

main :: IO()
main = execute robot
  where robot = Robot (Point 0 0) (Heading 0.0) Nothing
