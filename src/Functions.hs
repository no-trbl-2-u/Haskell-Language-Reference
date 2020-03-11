module Functions where

import Data.Char (toUpper)

-- To prevent the need for Specific type constraints when unneeded.
{-# LANGUAGE FlexibleContexts #-}

------------------------------------------------------------------------
-- Composing Functions
------------------------------------------------------------------------
-- Function Composition can be used to create new functions that
-- create a pipeline that the argument will pass through at invocation.

-- Initial Function
capitalize :: String -> String
capitalize [] = []
capitalize (a:as) = toUpper a : as

-- Composed Function
capitalizeLast :: String -> String
capitalizeLast = reverse . capitalize . reverse

------------------------------------------------------------------------
-- Pattern Matching
------------------------------------------------------------------------
-- So long as each possible case is accounted for, you can use
-- pattern matching to create functionality
isBothTrue :: Bool -> Bool -> Bool
isBothTrue True True  = True
isBothTrue True False = False
isBothTrue False _    = False

------------------------------------------------------------------------
-- Recursive Functions
------------------------------------------------------------------------
-- This function uses pattern matching and recursion to say
-- "do This" until "this first case is met -- ie: empty list"

{-# HLINT ignore myFoldR #-}
myFoldR :: (a -> b -> b) -> b -> [a] -> b
myFoldR f b  []   = b
myFoldR f b (x:xs) = f x (myFoldR f b xs)

{-# HLINT ignore sum_ #-}
sum_ :: [Int] -> Int
sum_ xs = myFoldR (+) 0 xs
