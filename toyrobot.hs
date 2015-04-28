import ToyRobot.Point
import ToyRobot.Table
import ToyRobot.Robot

robot :: Robot
robot = Robot (Point 0 0) 0 Nothing

main :: IO()
main = print robot
