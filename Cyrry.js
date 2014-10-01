//currying
function part_app(f, x) {
	def paed(y) {
		return f(x, y)
	}
	return paed;
}

function curry(f) {
	def curried(b) {
		return part_app(f, b);
	}
	return currried;
}

function curry(f, arguments) {
	for (var arg in arguments) {

	}
}

//Not sure the above tactics are generalizable.