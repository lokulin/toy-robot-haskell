module ToyRobot.HeadingSpec (main, spec) where

import ToyRobot.Heading
import ToyRobot.Point
import Test.Hspec


main :: IO()
main = hspec spec

spec :: Spec
spec = do
  describe "Heading" $ do
    describe "vector" $ do
      context "when called with" $ do
        it "-0.5 returns a vector (-1.0, 0.0)" $ do
          vector (Heading (-0.5)) `shouldBe` Point (-1.0) 0.0
        it "0.0 returns a vector (0.0, 1.0)" $ do
          vector (Heading 0.0) `shouldBe` Point 0.0 1.0
        it "0.5 returns a vector (1.0, 0.0)" $ do
          vector (Heading 0.5) `shouldBe` Point 1.0 0.0
        it "1.0 returns a vector (0.0, -1.0)" $ do
          vector (Heading 1.0) `shouldBe` Point 0.0 (-1.0)
        it "1.5 returns a vector (-1.0, 0.0)" $ do
          vector (Heading 1.5) `shouldBe` Point (-1.0) 0.0
        it "0.25 returns a vector (0.5, 0.5)" $ do
          vector (Heading 0.25) `shouldBe` Point (sin (pi * 0.25)) (sin (pi * 0.25))

    describe "moveTo" $ do
      context "when provided a location of (1.0, 1.0) and a heading of 0.0" $ do
        it "returns a new location (1.0, 2.0)" $ do
          moveTo (Point 1.0 1.0) (Heading 0.0) `shouldBe` Point 1.0 2.0

    describe "rotate" $ do
      context "when rotated Left" $ do
        it "from 0.5 it returns a new Heading 0.0" $ do
          rotate (Heading 0.5) ToLeft `shouldBe` Heading 0.0
      context "when rotated Right" $ do
        it "from 0.5 it returns a new Heading 1.0" $ do
          rotate (Heading 0.5) ToRight `shouldBe` Heading 1.0

