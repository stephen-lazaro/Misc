public class Euler44 {
	static int testLimit = 10000;
	int value;

	private static class Pentagonal {
		int data;

		public Pentagonal(int n) {
			this.data = (n*(3*n - 1)) / 2;
		}
		public static boolean is(int n) {
			if (((int) Math.sqrt(24*n + 1) * (int) Math.sqrt(24*n + 1)) == 24*n + 1) {
				if (Math.sqrt(24*n + 1) % 6 == 5) {
					return true;
				}
				return false;
			} else {
				return false;
			}
		}
		public int getData() {
			return this.data;
		}
	}
	public Euler44() {
		int min = 100000;
		Pentagonal beingTestedOut;
		Pentagonal beingTestedIn;
		for (int i = 0; i < testLimit; i++) {
			beingTestedOut = new Pentagonal(i);
			for (int j = i + 1; j < testLimit; j++) {
				beingTestedIn = new Pentagonal(j);
				int sum = beingTestedIn.getData() + beingTestedOut.getData();
				int dif = Math.abs(beingTestedIn.getData() - beingTestedOut.getData());
				if (Pentagonal.is(sum) && Pentagonal.is(dif)) {
					if (dif < min) {
						min = dif;
					}
				}
			}
		}
		this.value = min;
	}
	public int get() {
		return this.value;
	}
	public static void main(String[] args) {
		Pentagonal z;
		for (int i = 0; i < testLimit; i++) {
			z = new Pentagonal(i);
			if (Pentagonal.is(i)) {
				System.out.format("%d\n", z.getData());
				System.out.format("%b\n", Pentagonal.is(z.getData()));
			}
		}
		Euler44 answer = new Euler44();
		System.out.format("%d", answer.get());
	}
}