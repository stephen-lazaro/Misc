import java.util.Arrays;
import java.util.ArrayList;
//Note firstly that b MUST be prime, since p(0) = b is prime.
//This doesn't yet return anything, I think the breaking conditions in the get() are bad
public class Euler27 {
    int answer;
    private static class Eratosthenes {
        private boolean[] data;
        public ArrayList<Integer> primes;
        public Eratosthenes(int limit) {
            data = new boolean[limit-2];
            int rootlim = (int) Math.ceil(Math.sqrt(limit));
            Arrays.fill(data, true);
            for (int i = 2; i < rootlim; i++) {
                if (data[i - 2] == true) {
                    for (int j = 0; i*i + j*i < limit; j++) {
                        data[i*i + j*i - 2] = false;
                    }
                }
            }
            this.primes = new ArrayList<Integer>();
            for (int k = 0; k < data.length; k++) {
                if (data[k] == true) {
                    primes.add(k + 2);
                }
            }
        }
        public boolean is(int m) {
            if (m <= 1) return false;
            return data[m - 2] == true;
        }
    }
    private static class Quadratic {
        private int acoeff;
        private int bcoeff;
        public Quadratic(int a, int b) {
            acoeff = acoeff;
            bcoeff = bcoeff;
        }
        public int get(int n) { 
            return n*n + acoeff*n + bcoeff;
        }
        public int coeffProd() {
            return acoeff * bcoeff;
        }
        public int numPrimes(Eratosthenes primetest) {
            boolean test = true;
            int acc = 0;
            while (test) {
                test = primetest.is(this.get(acc));
		if (test) {
                    acc += 1;
                }
            }
            return acc;
        }
    }
    public int get(Eratosthenes primetest) {
        int[] acoeffs = new int[1999];
        int acc = 0;
        for (int j = 0; j < acoeffs.length; j++) {
            acoeffs[j] = j - 999; 
        } 
        for (int prime : primetest.primes) {
            if (prime > 1000) break;
            for (int j = 0; j < acoeffs.length; j++) {
                Quadratic q = new Quadratic(j, prime);
                acc = Math.max(q.numPrimes(primetest), acc);
            }
        }
        return acc;
    }
    public static void main(String[] args) {
        Eratosthenes primeTest = new Eratosthenes(50000);
        //System.out.format("5 is prime: %b", primeTest.is(5));
        //System.out.format("6 is prime: %b", primeTest.is(6));
        Euler27 answer = new Euler27();
        System.out.format("The answer is %d", answer.get(primeTest));
    }
}
