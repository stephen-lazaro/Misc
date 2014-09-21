public class DoublyLinkedList<E> {
	private static boolean debug = true;

	private static class Node<E> {
		private E data;
		private Node<E> prev;
		private Node<E> next;
		public Node(E e, Node<E> before, Node<E> later) {
			this.data = e;
			this.next = later;
			this.prev = before;
		}
		public Node(E e, Node<E> later) {
			this.data = e;
			this.next = later;
			this.prev = null;
		}
		public Node(E e) {
			this.data = e;
			this.next = null;
			this.prev = null;
		}
		//Getters
		public E getContent() {
			return this.data;
		}
		public Node<E> getNext() {
			return this.next;
		}
		public Node<E> getPrev() {
			return this.prev;
		}
		//Setters
		public void setNext(E e) {
			this.next = new Node<E>(e, this, this.next);
		}
		public void setNext(Node<E> later) {
			this.next = later;
		}
	}
	//Instance variables
	private Node<E> head;
	private Node<E> tail;
	private int size;
	public DoublyLinkedList() {
		this.tail = new Node<E>(null);
		this.head = new Node<E>(null, this.tail);
		this.size = 0;
	}
	//Getters
	public int getSize() {
		return this.size;
	}
	public Node<E> getFirst() {
		return this.head.getNext();
	}
	public Node<E> getLast() {
		return this.head.getPrev();
	}
	public boolean isEmpty() {
		if (this.size == 0) {
			return true;
		} else {
			return false;
		}
	}
	//Setters
	public void addFirst(E e) {
		Node<E> temp = new Node<E>(e, this.getFirst());
		this.head.setNext(temp);
		this.size++;
	}
	public void addLast(E e) {
		this.getLast().setNext(e);
		this.size++;
	}
	public E removeFirst() {
		if (this.isEmpty()) {return null;}
		Node<E> temp = this.getFirst();
		this.head.setNext(this.getFirst().getNext());
		this.size--;
		return temp.getContent();
	}
	public E removeLast() {
		if (this.isEmpty()) {return null;}
		Node<E> temp = this.getLast();
		this.getLast().getPrev().setNext(this.tail);
		this.size--;
		return temp.getContent();
	}
	public void print() {
		for (int i = 0; i < this.size; i++) {
			System.out.format("%d,", this.removeFirst());
		}
	}
	//Tests
	private static class Tests {
		DoublyLinkedList<Integer> t;
		public Tests() {
			this.t = new DoublyLinkedList<Integer>();
			this.t.addLast(new Integer(5));
			this.t.addFirst(new Integer(6));
		}
		public void go() {
			this.t.print();
		}
	}
	public static void main(String[] args) {
		if (debug == true) {
			Tests l = new Tests();
		}
	}
}