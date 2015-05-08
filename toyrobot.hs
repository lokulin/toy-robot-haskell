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

transform :: Robot -> IO()
transform !robot = do
    end <- isEOF
    unless end $ do
        line <- getLine
        case line of
          "REPORT" -> putStr $ show robot
          _ -> putStr []
        transform (case parseCommand line of
                    Just (Command f) -> f robot
                    Just (PlaceCommand f (Args point heading)) -> f robot point heading theTable
                    _ -> robot)

main :: IO()
main = transform robot
  where robot = Robot (Point 0 0) (Heading 0.0) Nothing
