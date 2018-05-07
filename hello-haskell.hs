-- Create a module, Main, that imports the System module
module Main where
import System.Environment

-- Every Haskell program starts with action called main, in a module named Main

-- Type declaration is optional in Haskell; compiler automatically figures them out and will give feedback if different from what you declare
-- Here we say main is of type IO carrying along values of unit type (), holding no information
main :: IO ()
-- IO type is an instance of the Monad class, which means there is certain type of extra info attached to this value and most functions don't need to worry about it
-- The basic value is void, ()
-- The extra info is IO actions performed using carried values
-- IO [String] and IO () belong to the same IO monad type but different base types
-- Act and pass values of types [String] and ()

-- Mondadic value often called actions, using IO monad as sequence of actions affecting the outside world
-- Sequence of actions may pass along basic values with each action able to act on the values
-- Think in terms of giving the computer a collection of definitions that tell it how to perform every funtion it might need
-- The collection of definitions use compositions of actions and functions
-- The compiler figures out execution path that puts everything together

-- Writing these definitions means setting up an equation
-- Left side defines name and, optionally, one or more patterns that bind variables
-- Right side defines composition of definitions that tells computer what to do when encountering the name
-- Equations are composed like algebra; right hand side can always be substituted for the left within the text of program and evaluate to the same value
-- This is called "referential transparency"

-- (Create an IO action directly, or by calling a function that performs IO action)
-- Two ways to create IO action:
    -- We can lift value into IO monad with return (with return being a function)
    -- We can combine two existing IO actions

-- The "bind" operator: >>=
    -- bind operator has different semantics for each monad; for the IO monad, it executes actions sequentially
    -- performs whatever external side-effects that result from actions
    -- semantics of this composition depend on the monad used
    -- cannot mix actions of different monad types in the same do-block

-- Combine two existing IO actions to create IO action using a do-block
-- The do-block is whitespace formatted, with two forms:
    -- name <- action1
        -- binds result of action1 to name, available to next actions
        -- 
    -- action2
        -- this form executes action2, sequencing it with the next line (if there is one) 

-- do-block
main = do
    -- Built-in action getArgs reads command line args, passes list of strings
    args <- getArgs
    -- Built-in function putStrLn takes string, creates action write string to console
    putStrLn ("Hello, " ++ args !! 0)
    -- Above takes index 0 element of arg list
    -- "args !! 0" args (list) at index 0 (element)
    -- Concatenates it to string "Hello, "
    -- Passes to putStrLn which creates new IO action
    -- The new action is stored in main of type IO ()
    -- Haskell system notices this definition and executes action in it

-- Compile and run the program!
-- $ stack ghc -- hello-haskell.hs -o hello_cli
-- Experiment!
-- $ ./hello_cli Lauren
