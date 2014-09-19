//This throws a nullpointer exception at the object
//But all the other values come through as 0.
public class Uninit {
	byte b;
	short i;
	int n;
	long m;
	boolean bool;
	float f;
	double d;
	char c;
	Object obj;
	public Uninit() {
	}
	public static void main(String[] args) {
		Uninit q = new Uninit();
		System.out.format("%b", q.bool);
		System.out.format("%d", q.i);
		System.out.format("%d", q.n);
		System.out.format("%d", q.m);
		System.out.format("%f", q.f);
		System.out.format("%f", q.d);
		System.out.format(Character.toString(q.c));
		System.out.format("", q.obj.toString());
	}
}