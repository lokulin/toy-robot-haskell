module ToyRobot.Command where

import ToyRobot.Point
import ToyRobot.Table
import ToyRobot.Heading
import ToyRobot.Robot

import Text.Regex.TDFA

data Command = Command (Robot -> Robot) |
               PlaceCommand (Robot -> Point -> Heading -> Maybe Table -> Robot) Args

data Args = Args Point Heading

placeRegex :: String
placeRegex = " ([0-9]+),([0-9]+),(NORTH$|EAST$|SOUTH$|WEST$)"

commandRegex :: String
commandRegex = "^(MOVE|LEFT|RIGHT|PLACE)(.*$)"

parseArgs :: String -> Maybe Args
parseArgs input = case parts of
  [] -> Nothing
  _ -> Just (Args (Point (read(head parts)::Float) (read(parts !! 1)::Float))
                  (headingFromStr (parts !! 2)))
  where(_,_,_,parts) = input =~ placeRegex :: (String,String,String,[String])

parseCommand :: String -> Maybe Command
parseCommand input = case parts of
  ["MOVE",""] -> Just (Command move)
  ["LEFT",""] -> Just (Command left)
  ["RIGHT",""] -> Just (Command right)
  ["PLACE",rest] -> case parseArgs rest of
    Just args -> Just (PlaceCommand place args)
    Nothing -> Nothing
  _ -> Nothing
  where(_,_,_,parts) = input =~ commandRegex :: (String,String,String,[String])


