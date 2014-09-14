public class PandigitalPrime {
	private int data;
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

	public static boolean isPandigital(int n, int len) {
		String strOf = Integer.toString(new Integer(n));
		int count;
		if (strOf.contains(Character.toString(Character.forDigit(0, 10)))) {
			return false;
		}
		for (int k = 9; k > len; k--) {
			if (strOf.contains(Character.toString(Character.forDigit(k, 10)))) {
				return false;
			}
		}
		for (int i = 1; i < len; i++) {
			count = 0;
			for (int j = 0; j < strOf.length(); j++) {
				if (strOf.charAt(j) == Character.forDigit(i, 10)) {
					count++;
				}

			}
			if (count < 1 || count > 1) {
				return false;
			}
		}
		return true;
	}

	public PandigitalPrime() {
		Eratosthenes eratos = new Eratosthenes(1000000000);
		boolean[] primes = eratos.getArray();
		for (int i = 987654321; i > 9; i--) {
			if (primes[i - 2] == true) {
				if (PandigitalPrime.isPandigital(i, Integer.toString(i).length())) {
					this.data = i;
					return;
				}
			}
		}
	}

	public int getPrime() {
		return this.data;
	}

	public static void main(String[] args) {
		PandigitalPrime prime = new PandigitalPrime();
		System.out.format("%d", Integer.toString(new Integer(981234567)).length());
		System.out.format("%b", PandigitalPrime.isPandigital(981234567, 9));
		System.out.format("%b", PandigitalPrime.isPandigital(4123, 4));
		System.out.format("%b", PandigitalPrime.isPandigital(881765432, 9));
		System.out.format("%b", PandigitalPrime.isPandigital(97654321, 8));
		System.out.format("%d", prime.getPrime());
	}
}