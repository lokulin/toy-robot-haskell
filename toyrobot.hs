import ToyRobot.Point
import ToyRobot.Table
import ToyRobot.Robot

import Data.Char

theRobot :: Robot
theRobot = Robot (Point 0 0) 0 (Just (Table (Point 0 0) (Point 4 4)))

sendCommand :: Robot -> String -> Robot
sendCommand robot "MOVE" = move robot
sendCommand robot "LEFT" = left robot
sendCommand robot "RIGHT" = right robot
sendCommand robot "REPORT" = robot
sendCommand robot _ = robot

execute :: String -> String
execute = unlines . filter (\return -> length return > 0 ) . map (\line -> show (sendCommand theRobot line)) . lines

report :: String -> IO()
report string = putStrLn string

main :: IO()
-- main = print (botit ["MOVE","RIGHT","MOVE","LEFT","REPORT"])
-- main = interact execute
main = do
  s <- getContents
  let r = show (foldl(\robit command -> sendCommand robit command) theRobot (lines s))
  print r
