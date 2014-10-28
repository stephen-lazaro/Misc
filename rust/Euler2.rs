//Euler2.rs

fn fib(last: (uint, uint))-> (uint, uint) {
    let (prevprev, prev) = last;
    (prev, prev + prevprev)
}

//Traverse the range and return the answer
fn get()-> uint {
	let mut x = (0u, 1u);
	let mut answer = 0u;
	while x.val1() <= 4_000_000u {
        x = fib(x);
        let b = x.val1();
        if b % 2u == 0u {
            answer += b;
        }
	}
	answer
}

fn get_fn(x: (uint, uint), acc: uint)-> uint {
    if x.val1() > 4_000_000u { return acc };
    let (a,b) = fib(x);
    let incr = if b % 2u == 0u {b} else {0};
    get_fn((a, b) , acc + incr)
}

//Main
fn main() {
	print!("{}\n", get());
	print!("{}\n", get_fn((0,1), 0));
}