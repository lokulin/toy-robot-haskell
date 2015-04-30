import ToyRobot.Point
import ToyRobot.Table
import ToyRobot.Robot

import Data.Char
import Control.Monad.State

theRobot :: Robot
theRobot = Robot (Point 0 0) 0 (Just (Table (Point 0 0) (Point 4 4)))

sendCommand :: String -> StateT Robot IO ()
sendCommand command = do
  r <- get
  put (case command of
    "MOVE" -> move r
    "LEFT" -> left r
    "RIGHT" -> right r
    "REPORT" -> r
    _ -> r)
  if (command == "REPORT")
  then do
    lift $ putStrLn $ show r
  else return ()

--execute :: State Robot String
--execute = do
--  sendCommand "MOVE"

main :: IO()
main = evalStateT (sendCommand "REPORT") theRobot
