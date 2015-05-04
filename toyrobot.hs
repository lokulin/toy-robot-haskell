import ToyRobot.Point
import ToyRobot.Table
import ToyRobot.Robot

import System.IO
import Data.Char

sendCommand :: Robot -> [Char] -> Robot
sendCommand robot "MOVE" = move robot
sendCommand robot "LEFT" = left robot
sendCommand robot "RIGHT" = right robot
sendCommand robot "PLACE" = place robot (Point 0 0) 0 (Just (Table (Point 0 0) (Point 4 4)))
sendCommand robot x  = robot

execute :: Robot -> IO()
execute robot = do
    end <- isEOF
    if end
      then return ()
      else do
        command <- getLine
        if command == "REPORT" then putStrLn (show robot) else putStr ""
        execute (sendCommand robot command)

main :: IO()
main = do
    --let robot = Robot (Point 0 0) 0 Nothing
    let robot = Robot (Point 1 2) 0.5 (Just (Table (Point 0 0) (Point 4 4)))
    execute robot
