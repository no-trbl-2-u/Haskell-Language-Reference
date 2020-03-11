module FileSystem where

import System.IO
import Control.Monad

import Data.Char
import Data.List.Split

type FileHandler a = ([String] -> a)

data Worker a = Worker {
  name :: String,
  age :: Int,
  job :: String
} deriving Show

-- Utils
readInt :: String -> Int
readInt = read

toWorker :: [String] -> Worker a
toWorker (a : b : c : rest) = Worker {name = a, age = read b, job = c}

-- Main Driver
handleFile :: Show a => FilePath -> FileHandler a -> IO ()
handleFile file handler = do
  contents <- readFile file
  print . handler . lines $ contents

-- Handlers
formatNumbers :: [String] -> [Int]
formatNumbers = map readInt . concatMap words

formatCsvToWorkers :: [String] -> [Worker a]
formatCsvToWorkers = map (toWorker . splitOn ",")

-- Files
numbersFile :: Show a => FileHandler a -> IO()
numbersFile = handleFile "./src/numbers.txt"
-- Example -- numbersFile $ sum . formatNumbers

csvFile :: Show a => FileHandler a -> IO()
csvFile = handleFile "./src/csvData.csv"
-- Example -- csvFile formatCsvToWorkers