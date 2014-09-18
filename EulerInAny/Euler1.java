//Euler1
//Finis, compiles, runs, gets the right answer
public class Euler1 {
	int acc;
	public Euler1() {
		this.acc = 0;
		for (int i = 0; i < 1000; i++) {
			if (i % 3 == 0 || i % 5 == 0) {
				this.acc = this.acc + i;
			}
		}
	}
	public int get() {
		return this.acc;
	}
	public static void main(String[] args) {
		Euler1 answer = new Euler1();
		System.out.format("%d\n", answer.get());
	}
}