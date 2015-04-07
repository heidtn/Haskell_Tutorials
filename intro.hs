-- hooray for Haskell!  Some basic functions and executions.  Based off of Learn You a Haskell for Great Good
-- compile with ghc -o intro intro.hs, then execute with ./intro

-- the parens are needed because Haskell will attempt to pass doubleUs to print.  Order of operations is FPEMDAS.  Say that aloud and giggle.
-- Alternatively $ can be used after print
-- the do notation here forces individual execution and will be delved into further later
main = do
	print ( 2 + 2 )

	-- prints the number following 2
	print ( succ 2 )

	-- prints the number following 2 then multiplies by 2
	print ( succ 2 * 2 )

	-- multiplies 2 by 2 then prints the number following the result
	print ( succ (2 * 2))

