fn is_mod3(x: int) -> bool {
	if x % 3i == 0i { true } else { false };
}

fn is_mod5(y: int) -> bool {
	if y % 5i == 0i { true } else { false };
}

fn main() {
	let mut answer = 0;
	for i in range(0i, 1000i) {
        if is_mod3(i) || is_mod5(i) {
        	answer += i;
        }
	}
	print!("{}", answer);
}