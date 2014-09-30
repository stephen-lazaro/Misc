//Finis. We have overflow with much higher test limit.
//Most of the issues were in:
//(i) properly calculating Pentagonal numbers
//(ii) properly testing for pentagonal numbers
//(iii) getting the testing parameters correct
//The algorithm itself is straight forward, essentially brute force.
public class Euler44 {
	static int testLimit = 10000;
	int value;

	private static class Pentagonal {
		int data;

		public Pentagonal(int n) {
			this.data = (3*n*n - n) / 2;
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
		int min = 100000000;
		Pentagonal beingTestedOut;
		Pentagonal beingTestedIn;
		for (int i = 1; i < testLimit; i++) {
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
		Euler44 answer = new Euler44();
		System.out.format("%d\n", answer.get());
	}
}