//Euler3.java
//Finis, compiles, runs and gives right answer
//Interesting was the necessity of using BigIntegers
//The BigInteger interface is odd, not gonna lie
import java.lang.Math;
import java.math.*;

public class Euler3 {
	int data;
	private static class Eratosthenes {
		boolean[] data;
		public Eratosthenes(int limit) {
			this.data = new boolean[limit + 1];
			for (int i = 2; i < limit; i++) {
				this.data[i - 2] = true;
			}
			int testLimit = (int) Math.sqrt(limit);
			for (int j = 2; j < testLimit; j++) {
				if (this.data[j - 2] == true) {
					for (int k = 0; j*j + j*k < limit; k++) {
						this.data[j*j + j*k - 2] = false;
					}
				}
			}
		}
		public boolean isPrime(int n) {
			try {
				if (this.data[n - 2] == true) {
					return true;
				} else {
					return false;
				}
			}
			catch (ArrayIndexOutOfBoundsException e) {
				return false;
			}
		}
	}
	public Euler3() {
		Eratosthenes test = new Eratosthenes(15000);
		BigInteger huge = new BigInteger("600851475143");
		for (int t = 10000; t > 0; t--) {
			if (huge.mod(BigInteger.valueOf(t)).compareTo(new BigInteger("0")) == 0) {
				if (test.isPrime(t)) {
					this.data = t;
					return;
				}
			}
		}
		this.data = 0;
	}
	public int get() {
		return this.data;
	}
	public static void main(String[] args) {
		Euler3 test = new Euler3();
		System.out.format("%d", test.get());
	} 
}