open Core.Std;;

let ofThreeOrFive x = x % 3 = 0 || x % 5 = 0;;

let range x y = 
	let rec ranger x y acc =
		match y with
			|y when x > y  -> []
			|y when x = y -> (y::acc)
			|y -> ranger x (y - 1) (y::acc)
	in ranger x y [];;

let divisible x = List.filter ~f:ofThreeOrFive (range 1 999);;

let answer = List.fold ~f:(+) ~init:0 (divisible ());;

printf "%d\n" answer;;