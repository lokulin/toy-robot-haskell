module ToyRobot.Command where

import ToyRobot.Point
import ToyRobot.Heading

import Text.Regex.TDFA

data Command = MOVE | LEFT | RIGHT | REPORT | PLACE
data Args = Args { location' :: Point
                 , heading' :: Heading
                 }

placeRegex :: String
placeRegex = "^PLACE ([0-9]+),([0-9]+),(NORTH|EAST|SOUTH|WEST)$"

parseArgs :: String -> Maybe Args
parseArgs input
  | length args <= 0 = Nothing
  | otherwise = do
    let xx = read(head args)::Float
    let yy = read(args !! 1)::Float
    Just (Args (Point xx yy) (headingFromStr (args !! 2)))
  where(_,_,_,args) = input =~ placeRegex :: (String,String,String,[String])

parseCommand :: String -> (Maybe Command, Maybe Args)
parseCommand line = case take 6 line of
  "MOVE" -> (Just MOVE, Nothing)
  "LEFT" -> (Just LEFT, Nothing)
  "RIGHT" -> (Just RIGHT, Nothing)
  "REPORT" -> (Just REPORT, Nothing)
  "PLACE " -> case parseArgs line of
    Just args -> (Just PLACE, Just args)
    Nothing -> (Nothing, Nothing)
  _ -> (Nothing, Nothing)


