

--basic maximum function using recursion (' is valid in function and variable names!)
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "empty list!"
maximum' [x] = x
maximum' (x:xs) 
		| x > maxTail = x
		| otherwise = maxTail
		where maxTail = maximum' xs

-- the interesting part of this one is that if the guard fails, the pattern match falls through to the next matching function (because no 'otherwise')
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
	| n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs

zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys


-- a very cool part of Haskell is quicksort implementation b/c its so short!
-- take a single value, all numbers less than that go to left and all greater go to right
-- now do this again for all of the numbers to the left and again for all the numbers to the right
-- [x, b, a, d, f, e] -> [b, a, x, d, f, e] -> [a, b, x, d, f, e] -> [a, b, x, d, e, f] (where x is 'c')
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
	let	smallerSorted = quicksort [a | a <- xs, a <= x]
		biggerSorted = quicksort [a | a <- xs, a > x]
	in 	smallerSorted ++ [x] ++ biggerSorted


-- this is an example of a higher order function, that is, a function that can take another function as an argument
-- parens are needed this time around to tell the compiler it takes a function that takes 2 things and produces a third (i.e. + - / *, or create a tuple like normal zip)
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys


--example sieve of Eratosthenes
primes :: [Integer] -> [Integer]
primes [] = []
primes (x:xs) = x : primes (filter (isntDivisible x) xs) 

isntDivisible :: Integer -> Integer -> Bool
isntDivisible x y  = y `mod` x > 0

main = do
	print (maximum' [1, 2, 3, 9, 4, 5, 6]) 
	
	print (take' 3 [1,2,3,4,5,6,7])

	print (zip' [1,2,3,4,5] ['a'..'e'])

	print (quicksort [7, 2, 3, 4, 1, 9, 5, 6, 0, 8])

	print (zipWith' (*) [1, 2, 3, 4] [1, 2, 3, 4])

	print (primes [2..20])