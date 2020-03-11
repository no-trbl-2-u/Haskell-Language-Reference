module FileSystem where

import System.IO
import Control.Monad

readFraction :: (Fractional a, Read a) => String -> a
readFraction = read

readInt :: String -> Int
readInt = read

applyFuncToFile :: Show b => ([Int] -> b) -> IO ()
applyFuncToFile fn = do
  contents <- readFile "numbers.txt"
  print . fn . convert . words $ contents
    where
      convert = map readInt

