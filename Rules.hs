module Rules (custom) where

import Control.Concurrent (threadDelay)
import System.Environment (getArgs)

seed :: String
seed = let ds = replicate 60 '-' in ds ++ ('0':ds)

ruleCon '1' = '0'
ruleCon '0' = '-'

match :: String -> String -> Char
match r "---" = ruleCon (r!!7)
match r "--0" = ruleCon (r!!6)
match r "-0-" = ruleCon (r!!5)
match r "-00" = ruleCon (r!!4)
match r "0--" = ruleCon (r!!3)
match r "0-0" = ruleCon (r!!2)
match r "00-" = ruleCon (r!!1)
match r "000" = ruleCon (r!!0)

evolve :: String -> String -> String
evolve r a@[x,y] = a
evolve r a@(x:xs) = match r (take 3 a) : evolve r xs

hEvolve :: String -> String -> String
hEvolve r xs = (tail . reverse) $ evolve r ('-':xs)

apply :: String -> String -> Int -> [String]
apply r xs 0 = []
apply r xs n = xs : apply r new (n-1)
	where
	new = hEvolve r xs

custom r = unlines . apply r seed

suspense :: [String] -> IO ()
suspense [] = return ()
suspense (x:xs) = do
	print x
	threadDelay 50000
	suspense xs

slowPrint r = suspense . apply r seed

main = do
	args <- getArgs
	let xs = take 2 args
	slowPrint (xs!!0) (read (xs!!1))
