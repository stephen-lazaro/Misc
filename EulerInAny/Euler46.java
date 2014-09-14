import java.util.*;

public class Euler46 {
	int data;
	Eratosthenes primes;

	private static class Eratosthenes {
		private ArrayList<Integer> data;
		public Eratosthenes(int limit) {
			boolean[] acc = new boolean[limit];
			this.data = new ArrayList<Integer>();
			for (int i = 2; i < limit; i++) {
				acc[i - 2] = true;
			}
			for (int j = 2; j < Math.ceil(Math.sqrt(limit)); j++) {
				if (acc[j - 2] == true) {
					for (int k = 0; j*j + k * j < limit; k++) {
						acc[j*j + k*j - 2] = false;
					}
				}
			}
			for (int i = 0; i < acc.length; i++) {
				if (acc[i] == true) {
					this.data.add(i + 2);
				}
			}
		}
		public boolean is(Integer n) {
			return this.data.contains(n);
		}
		public ArrayList<Integer> getArray() {
			return this.data;
		}
	}

	public Euler46() {
		this.primes = new Eratosthenes(10000);
		for (Integer i = 9; i < 6000; i = i + 2) {
			if (this.primes.is(i)) {
			} else {
				for (Integer j = 1; 2 * j * j > i; j++) {
					if (this.primes.is(i - 2*j*j)) {
						this.data = i;
						return;
					}
				}
			}
		}
	}

	public static void main(String[] args) {
		Euler46 result = new Euler46();
		System.out.format("%b\n", result.primes.is(new Integer(13)));
		System.out.format("%d\n", result.data);
	}
}