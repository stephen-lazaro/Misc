//Euler2.java
//Finis, compiles, runs and gives right answer
import java.util.*;

public class Euler2 {
	private static class Fibonacci {
		ArrayList<Integer> acc;
		public Fibonacci() {
			this.acc = new ArrayList<Integer>();
			this.acc.add(0);
			this.acc.add(1);
		}
		public int next() {
			this.acc.add(this.acc.get(this.acc.size() - 2) + this.acc.get(this.acc.size() - 1));
			return this.acc.get(this.acc.size() - 1);
		}
	}

	Fibonacci fibs;
	public Euler2() {
		this.fibs = new Fibonacci();
	}
	public int get() {
		int acc = 0;
		Fibonacci fibs = new Fibonacci();
		int nextTerm = 0;
		while (nextTerm < 4000000) {
			if (nextTerm % 2 == 0) {
				acc = acc + nextTerm;
			}
			nextTerm = fibs.next();
		}
		return acc;
	}
	public static void main(String[] args) {
		Euler2 answer = new Euler2();
		System.out.format("%d", answer.get());
	}
}