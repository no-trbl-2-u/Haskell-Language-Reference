module Types where

-------------------------------------------------------------------------
-- Types --
-------------------------------------------------------------------------
-- Woot and Bleh are now of type "Mood" with the ability to print
data Mood = Woot | Bleh deriving (Show)
-------------------------------------------------------------------------
-- Aliases --
-------------------------------------------------------------------------
type URL = String

-- We can now use the type URL for a specific kind of string
baseUrl :: URL
baseUrl = "www.google.com"
-------------------------------------------------------------------------
-- Type constraints
-------------------------------------------------------------------------
-- When you need to use a type belonging to a set/group, you can constrain
-- all "a" to be within the typeclass "Num"
sumPlusOne :: Num a => [a] -> a
sumPlusOne = foldr (+) 1
-------------------------------------------------------------------------
-- Records
-------------------------------------------------------------------------
-- Records can be used to create more complex types similar to
-- Object Literals in JS/TS --> {name: String, age: Int}
-- deriving Eq and Ord is for the following Typeclass section
data Person = Person {name :: String, age :: Int} deriving (Show, Ord)

-- You can create variables/instances of Person
anthony :: Person
anthony = Person { name="TJ", age=30 }

youngAnthony :: Person
youngAnthony = Person {name="TJ", age=19}

dave :: Person
dave = Person { name="Dave", age=25 }

arun :: Person
arun = Person {name="Arun", age=30}

printName :: Person -> IO ()
printName Person {name = p, age = a} = print p

-- name && age are new functions that can be used to return a key/value
-- from the constructor function "Person"
getPersonAsTuple :: Person -> (String, Int)
getPersonAsTuple p = (name p , age p)

-- [Person] -> [(String, Int)]
-- map getPersonAsTuple [anthony, dave] ---- [("TJ",30),("Dave",25)]
-------------------------------------------------------------------------

-- Explain TypeClasses

-- Instead of deriving Eq, we can say "In the instance of Eq for "Person"
-- do this ...
instance Eq Person where
  p1 == p2 = name p1 == name p2

-- Typeclasses allow you to define behavior on your types when a certain
-- kind of behavior may not exist. For instance, how would you sort a Person?

--Because we've derived Eq and Ord, we can do things like this
-- anthony == dave --- False
-- anthony == youngAnthony --- True