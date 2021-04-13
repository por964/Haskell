-- ghci> doubleList = mapList (2*)
--ghci> doubleList [3,5,9]
--[6,10,18]
mapList f [] = []
mapList f (x:xs) = f x : mapList f xs


--ghci> myDrop 2 "foobar"
--"obar"
myDrop n xs = if n <= 0 || null xs
              then xs
              else myDrop (n - 1) (tail xs)