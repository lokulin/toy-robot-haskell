
plus :: String -> IO String -> (String -> IO()) -> IO String
plus _ y z = do
  z "fuck yo"
  yy <- y
  return yy

doSomething :: (String -> t) -> t
doSomething x = do
  let f = "blah"
  x f

main :: IO()
main = do
  let d = return ("xx"::String)
  s <- getContents
  let z = putStrLn
  _ <- foldr(\x y -> plus x y z) d (lines s)
  doSomething putStrLn
