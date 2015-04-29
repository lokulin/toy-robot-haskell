import ToyRobot.Point
import ToyRobot.Table
import ToyRobot.Robot

import Data.Char

robot :: Robot
robot = Robot (Point 0 0) 0 Nothing

sendCommand :: String -> String
sendCommand "MOVE" = "MOVING"
sendCommand "LEFT" = "LEFTING"
sendCommand "RIGHT" = "RIGHTING"
sendCommand "PLACE" = "PLACING"
sendCommand "REPORTING" = "REPORTING"
sendCommand x = ""

execute :: String -> String
execute = unlines . map (\line -> sendCommand line) . lines

report :: String -> IO()
report string = putStrLn string

main :: IO()
main = interact execute
