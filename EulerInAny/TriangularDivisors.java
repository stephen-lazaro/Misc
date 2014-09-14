//Divisible numbers
public class TriangularDivisors {
	private int pos;
	private int value;

	private static class Eratosthenes {
		private boolean[] data;
		public Eratosthenes(int limit) {
			this.data = new boolean[limit];
			for (int i = 2; i < limit; i++) {
				this.data[i - 2] = true;
			}
			for (int j = 2; j < Math.ceil(Math.sqrt(limit)); j++) {
				if (this.data[j - 2] == true) {
					for (int k = 0; j*j + k * j < limit; k++) {
						this.data[j*j + k*j - 2] = false;
					}
				}
			}
		}
		public boolean[] getArray() {
			return this.data;
		}
	}
	private static class Divisors {
		private int data;

		public Divisors(int n, boolean[] primes) {
			int nod = 1;
			int count;
			int med = n;
			int prime;
			for (int j = 0; j < primes.length - 2; j++) {
				prime = j + 2;
				if (prime * prime > n) {
					this.data = nod * 2;
					return;
				}
				if (primes[prime] == true) {
					count = 1;
					while (med % prime == 0) {
						count = count + 1;
						med = med / prime;
					}
					nod = nod * count;
				}
				if (med == 1) {
					this.data = nod;
					return;
				}
			}
			this.data = nod;
		}
		public int getCount() {
			return this.data;
		}
	}

	public TriangularDivisors(int n) {
		this.value = n*(n + 1) / 2;
	}
	public int getDivisors(boolean[] primes) {
		Divisors div = new Divisors(this.value, primes);
		return div.getCount();
	}
	public int getValue() {
		return this.value;
	}

	private static final class Test {
		public Test(int n) {
			Eratosthenes eratos = new Eratosthenes(75000);
			boolean[] primes = eratos.getArray();
			System.out.format("%d", 6 % 3);
			System.out.format("%d", 6 % 2);
			for (int j = 1; j < n; j++) {
				TriangularDivisors div = new TriangularDivisors(j);
				System.out.format("TNum: %d\n", div.getValue());
				System.out.format("DivCount: %d\n", div.getDivisors(primes));
			}
			int j = 10;
			TriangularDivisors div = new TriangularDivisors(j);
			while (div.getDivisors(primes) < 500) {
				j++;
				div = new TriangularDivisors(j);
			}
			System.out.format("%d", div.getDivisors(primes));
		}
	}
	public static void main(String[] args) {
		Test testr = new Test(10);
	}
}