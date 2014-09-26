import java.util.*;

public class uniqueTest {
	HashMap<String, Boolean> data;
	Boolean val;

	public uniqueTest(String input) {
		this.data = new HashMap<String, Boolean>();
		for (char c : input.toCharArray()) {
			String keye = String.valueOf(c);
			if (this.data.containsKey(keye)) {
				this.val = false;
				return;
			} else {
				this.data.put(keye, true);
			}
		}
		this.val = true;
	}

	public Boolean getValue() {
		return this.val;
	}

	public static void main(String[] args) {
		uniqueTest answer = new uniqueTest(args[0]);
		System.out.format("%b", answer.getValue());
	}
}