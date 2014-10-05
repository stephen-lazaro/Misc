public class WhiteSpacerIP {
	char[] data;
	public WhiteSpacerIP(String input, int size) {
		this.data = input.toCharArray();
		int k = 0;
		for (int i = 0; i < this.data.length; i++) {
			if (i > size) {
				break;
			}
			if (this.data[i] == ' ') {
				k += 2;
				for (int j = 3; j + i < this.data.length; j++) {
					this.data[i + j] = input.charAt(i - k + j);
				}
				this.data[i] = '%';
				this.data[i + 1] = '2';
				this.data[i + 2] = '0';
				i = i + 2;
				System.out.println(new String(this.data));
			}
		}
	}
	public String get() {
		return new String(this.data);
	}
	public static void main(String[] args) {
		WhiteSpacerIP answer = new WhiteSpacerIP("Mr John Smith       ", 13);
		System.out.println(answer.get());
	}
}

// Mr John Smith
// Mr JoJohn Smith
// Mr%20John Smith
// Mr%20John SmSmith
// Mr%20John%20Smith