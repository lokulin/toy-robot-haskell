module ToyRobot.RobotSpec (main, spec) where

import ToyRobot.Robot
import ToyRobot.Table
import ToyRobot.Heading
import ToyRobot.Point
import Test.Hspec

main :: IO()
main = hspec spec

spec :: Spec
spec = do
  let table = Table (Point 0.0 0.0) (Point 4.0 4.0)
  let unplaced_robot = Robot (Point 0.0 0.0) (Heading 0.0) Nothing
  let north_facing_robot = Robot (Point 0.0 0.0) (Heading 0.0) (Just table)
  let north_facing_robot2 = Robot (Point 0.0 1.0) (Heading 0.0) (Just table)
  let south_facing_robot = Robot (Point 0.0 0.0) (Heading 1.0) (Just table)

  describe "Robot" $ do
    describe "when unplaced" $ do
      context "move" $ do
        it "doesn't move the robot" $ do
          move unplaced_robot `shouldBe` unplaced_robot
      context "left" $ do
        it "doesn't rotate the robot" $ do
          left unplaced_robot `shouldBe` unplaced_robot
      context "right" $ do
        it "doesn't rotate the robot" $ do
          right unplaced_robot `shouldBe` unplaced_robot

    describe "when placed at (0.0, 0.0)" $ do
      context "move when" $ do
        it "facing north moves the robot to (0.0 1.0)" $ do
          move north_facing_robot `shouldBe` north_facing_robot2
        it "facing south it doesn't move the robot" $ do
          move south_facing_robot `shouldBe` south_facing_robot

