module FileSystem where

import System.IO
import Control.Monad
import Data.Char

type FileHandler a = ([String] -> a)

data Worker a = Worker {
  name :: String,
  age :: Int,
  job :: String
}

-- Utils
readInt :: String -> Int
readInt = read

--toWorker :: String -> Worker
toWorker str = 

-- Main Driver
handleFile :: Show a => FilePath -> FileHandler a -> IO ()
handleFile file handler = do
  contents <- readFile file
  print . handler . lines $ contents

-- Handlers
formatNumbers :: [String] -> [Int]
formatNumbers = map readInt . concatMap words

-- Files
numbersFile :: Show a => FileHandler a -> IO()
numbersFile = handleFile "numbers.txt"
-- Example - numbersFile $ sum . formatNumbers

csvFile :: Show a => FileHandler a -> IO()
csvFile = handleFile "csvData.csv"
-- Example - csvFile formatCsv