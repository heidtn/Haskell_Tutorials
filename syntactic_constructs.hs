

-- a good idea is to specify I/O for functions as well as constrained types
lucky :: (Integral a) => a -> String
-- patterns are checked from top to bottom 
lucky 7 = "LUCKY SEVEN!"
lucky x = "Not so lucky..."

-- the Integral type specifies both Int and Integer
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = product [1 .. n]

-- recursive functions also pattern match
factorialRecurse :: (Integral a) => a -> a
factorialRecurse 0 = 1
factorialRecurse n = n * factorialRecurse (n - 1)

-- example of the empty element.  _ informs the program that we don't care about its value
first :: (a, b, c) -> a
first (x, _, _) = x

-- this is as patterns (@) which allows multiple different types of reference to the same thing
capital :: String -> String
capital all@(x:xs) = "The first letter of " ++ all ++ " is: " ++ [x] --x needs [] because its a Char and we can only concat [Char]


-- this is an example of using guards.  Kind of like an if else, but more readable
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
	| weight / height ^ 2 <= 18.5 = "BMI less than 18.5"  
    | weight / height ^ 2 <= 25.0 = "BMI less than 25.0"  
    | weight / height ^ 2 <= 30.0 = "BMI less than 30.0"  
    | otherwise                 = "You should see a doctor or something..."   

-- example of using the where keyword to define elements as well as pattern matching f:_ to firstname etc.
-- similarly the keywords let (some function) in (some use of that function) can be used, but is local (i.e. not across guards for instance)
initials :: String -> String -> String  
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."  
    where (f:_) = firstname  
          (l:_) = lastname

main = do
	print (lucky 7)
	print (lucky 13)

	print (factorial 10)
	print (factorialRecurse 10)

	print (first (1, 2, 3))
	print (capital "Dracula")

	print (bmiTell 85 1.9)

	print (initials "Natty" "Bumppo")