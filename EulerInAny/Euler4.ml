(*Euler4
 *)
open Core.std;;

let palindromic lz =
	lz == List.rev lz;;

let explode i =
	let rec aux i acc =
		match i with
			|0 -> acc
			|i -> aux (i / 10) ((i mod 10) :: acc)
	in aux i [];;

let (--) x y =
	let rec aux n acc =
		if n < i then acc else aux (n-1) (n :: acc)
	in aux j [];;


let isProductPalindrome x y = 
	palindromic (explode x * y)

let testSpace = 100--999

let makeTest x = (fun y:int -> isProductPalindrome x y )

let tests = map makeTest testSpace

let results lza lzb = 
	let rec aux lztup acc =
		match lztup
			|[] -> acc
			| ((f, x)::lztup) -> aux lztup ((f x)::acc)
	in aux (Core.list.zip (lza, lzb)) []

let answer = List.max (results tests testSpace)