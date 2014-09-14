(* So but note that a number is triangular iff 8x + 1 is square 
 Hence we need only convert words to their int value and 
 determine if 8  times that value plus one is square *)

 open Core.std;;

 let digitToInt x = 
 	match x with
 		|'a' -> 1
 		|'b' -> 2
 		|'c' -> 3
 		|'d' -> 4
 		|'e' -> 5
 		|'f' -> 6
 		|'g' -> 7
 		|'h' -> 8
 		|'i' -> 9
 		|'j' -> 10
 		|'k' -> 11
 		|'l' -> 12
 		|'m' -> 13
 		|'n' -> 14
 		|'o' -> 15
 		|'p' -> 16
 		|'q' -> 17
 		|'r' -> 18
 		|'s' -> 19
 		|'t' -> 20
 		|'u' -> 21
 		|'v' -> 22
 		|'w' -> 23
 		|'x' -> 24
 		|'y' -> 25
 		|'z' -> 26
 		|_ -> (-1)



let makeCharVals str = List.map digitToInt (Core.std.to_array str );;

let wordNumber str = List.foldr (+) (makeCharVals str);;

let isTriangular str = 
	let isTriangular inte =
		