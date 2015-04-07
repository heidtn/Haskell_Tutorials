-- common function format for Haskell.  Chained functions like this mean its easier to change later and further guarantee correctness.
doubleMe x = x * 2

doubleUs x y = doubleMe x + doubleMe y

-- conditionals just like in imparative languages.  Must always have an else!
doubleSmallNumber x = if x > 100
							then x
							else x * 2

-- list definitions don't play friendly with do notation
a = [1, 2, 3, 4]
b = [5..8]  -- sets b to [5, 6, 7, 8], can also do characters i.e. ['a'..'z']
-- list comprehensions! mutliply x*2 for each x in 1-10 where x*2 <= 12  
c = [x*2 | x <- [1..10], x*2 <= 12]
-- list comprehension of all possible combinations
d = [ x*y | x <- [2,5,10], y <- [8,10,11]]  

-- list of tuples where a tuple is its own type and must be consistent within a list
e = [("Baggins", 1), ("Brandybuck", 2), ("Took", 3)]

-- strings are considered lists and can be treated thusly!
removeUpperCase st = [ c | c <- st, c `elem` ['A'..'Z']] 


main = do
	-- doubles the numbers then adds them
	print ( doubleUs 10 12.0 )

	print ( doubleSmallNumber 99)

	print ( doubleSmallNumber 101)

	-- ++ concats lists.  This is slow for large lists!
	print (a ++ b)

	-- prepends 4 to a
	print (4:a)

	-- !! indexes lists
	print (a !! 3)

	print (head a)

	print (tail a)

	print (init a)

	print (last a)

	print (length a)

	print (null a)

	print (null [])

	print (reverse a)

	-- takes the first n elements of a list
	print (take 2 a)

	-- drops the first n elements of a list
	print (drop 2 a)

	-- also a maximum function, sum, product
	print (minimum a)

	-- cycle creates an infinitely repeating list!  we need take to slice it
	print (take 12 (cycle a))

	-- list comprehensions
	print (c)

	print (d)

	print (removeUpperCase "IdontLIKEFROGS")

	print (e)



