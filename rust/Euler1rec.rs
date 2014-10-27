fn is_mod3(x: int) -> bool {
	if x % 3i == 0i { true } else { false }
}

fn is_mod5(y: int) -> bool {
	if y % 5i == 0i { true } else { false }
}

fn answer(i: int, acc: int)-> int {
    if i == 1000 { return acc }
    let test = is_mod3(i) || is_mod5(i);
    match test {
    	true => answer(i+1, acc + i),
    	false => answer(i+1, acc),
    }
}

fn main() {
	print!("{}", answer(1, 0));
}