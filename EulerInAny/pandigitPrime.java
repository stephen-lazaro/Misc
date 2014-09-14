public static class Pandigital {
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

	public Pandigital() {
		Eratosthenes eratos = new Eratosthenes(1000000000);
		boolean[] primes = eratos.getArray();
	}

	public static void main(String[] args) {

	}
}