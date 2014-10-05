public class WhiteSpacer {
	StringBuilder data;
	public WhiteSpacer(String input, int size) {
		this.data = new StringBuilder();
		int i = 1;
		for (char c : input.toCharArray()) {
			if (c == ' ') {
				this.data.append("%20");
				i++;
			} else {
				this.data.append(c);
				i++;
			}
			if (i > size) {
				break;
			}
		}
	}
	public String get() {
		return this.data.toString();
	}
	public static void main(String[] args) {
		WhiteSpacer answer = new WhiteSpacer("Mr John Smith      ", 13);
		System.out.println(answer.get());
	}
}