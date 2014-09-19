//Euler12
import java.lang.Math;
import java.util.*;

public class Euler12 {
	static boolean debuga = false;
	private static class Eratosthenes {
		private boolean[] data;
		private ArrayList<Integer> primes;
		public Eratosthenes(int limit) {
			this.data = new boolean[limit];
			int sqrlim = (int) Math.sqrt(limit);
			for (int i = 0; i < limit; i++) {
				this.data[i] = true;
			}
			for (int j = 2; j < sqrlim; j++) {
				if (this.data[j-2] == true) {
					for (int k = 0; j*j + k*j < limit; k++) {
						this.data[j*j + k*j - 2] = false;
					}
				}
			}
			primes = new ArrayList<Integer>();
			for (int j=2; j < limit + 1; j++) {
				if (this.data[j-2] == true) {
					this.primes.add(j);
				}
			}
		}
		public boolean[] getData() {
			return this.data;
		}
		public ArrayList<Integer> getPrimes() {
			return this.primes;
		}
	}
	private static class Divisors {
		int divcount;
		public Divisors(int n, Eratosthenes test) {
			int rem = n;
			int exponent;
			ArrayList<Integer> primes = test.getPrimes();
			this.divcount = 1;
			int primeindex = 0;
			for (int i = 0; i < primes.size(); i++) {
				if (primes.get(i) * primes.get(i) > n) {
					this.divcount = 2 * this.divcount;
					return;
				}
				exponent = 1;
				while (rem % primes.get(i) == 0) {
					exponent++;
					rem = rem / primes.get(i);
				}
				this.divcount = this.divcount * exponent;
				if (rem == 1) {
					return;
				}
			}
		}
		public int getCount() {
			return this.divcount;
		}
	}
	private static class Triangular {
		int data;
		public Triangular(int n) {
			this.data = (n * (n+1)) / 2;
		}
		public int get() {
			return this.data;
		}
	}

	int data;
	public Euler12() {
		Eratosthenes test = new Eratosthenes(75000);
		for (int i = 0; i < 100000; i++) {
			Triangular item = new Triangular(i);
			Divisors divs = new Divisors(item.get(), test);
			if (divs.getCount() > 500) {
				this.data = item.get();
				return;
			}
		}
	}
	public int get() {
		return this.data;
	}
	public static void main(String[] args) {
		if (debuga == true) {
			for(int i = 0; i < 8; i++) {
				Triangular item = new Triangular(i);
				System.out.format("%d\n", item.get());
			}
		} else {
			Euler12 answer = new Euler12();
			System.out.format("%d", answer.get());
		}
	}
}