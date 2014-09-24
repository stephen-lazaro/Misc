//Linked List
//Appears to work perfectly.
public class LinkedList<E> {
	private static boolean debuga = false;
	private Node<E> head;
	private Node<E> tail;
	private int size;

	private static class Node<E> {
		private E data;
		private Node<E> next;
		public Node(E content, Node<E> later) {
			this.data = content;
			this.next = later;
		}
		public Node(E content) {
			this.data = content;
			this.next = null;
		}
		//Setters
		public void setNext(E stuff) {
			this.next = new Node<E>(stuff);
		}
		public void insertBetween(E stuff) {
			this.next = new Node<E>(stuff, this.next);
		}
		//Getters
		public Node<E> getNext() {
			return this.next;
		}
		public E getContent() {
			return this.data;
		}
	}

	public LinkedList(E head, E tail) {
		this.head = new Node<E>(head);
		this.tail = new Node<E>(tail);
		this.size = 2;
	}
	// // Is worst case linear in time because of Node children
	// // Converting a bunch of node linkages is not rec'd
	public LinkedList(Node<E> stuff) {
		this.head = stuff;
		Node<E> n;
		n = this.head;
		if (this.head.getNext() != null) {
			int count = 1;
			do {
				n = n.getNext();
				count++;
			} while (n.getNext() != null);
			this.tail = n;
			this.size = count + 1;
		} else {
			this.tail = null;
			this.size = 1;
		}
	}
	public LinkedList() {
		this.size = 0;
	}
	//Getters
	public E getHead() {
		return this.head.getContent();
	}
	public E getTail() {
		return this.tail.getContent();
	}
	public int getSize() {
		return this.size;
	}
	//Setters
	public void insertFront(E data) {
		this.head = new Node<E>(data, this.head);
		this.size++;
	}
	public void insertEnd(E data) {
		this.tail.setNext(data);
		this.tail = this.tail.next;
		this.size++;
	}
	//Mutators
	public E removeFront() {
		Node<E> temp = this.head;
		this.head = this.head.next;
		this.size--;
		return temp.getContent();
	}
	// // Is linear in time because of tail updates
	public E removeEnd() {
		Node<E> temp = this.tail;
		Node<E> n = this.head.next;
		while (n != temp) {
			n = n.getNext();
		}
		this.tail = n;
		n = null;
		this.size--;
		return temp.getContent();
	}
	public static void main(String[] args) {
		if (debuga == true) {
			Node<Integer> thing = new Node<Integer>(5);
			System.out.format("Data: %d\n", thing.getContent());
			thing.setNext(6);
			System.out.format("NextData: %d\n", thing.getNext().getContent());
			thing.insertBetween(7);
			System.out.format("NextData: %d\n", thing.getNext().getContent());
			System.out.format("NextNextData: %d\n", thing.getNext().getNext().getContent());
			LinkedList<Integer> stuff = new LinkedList<Integer>(thing);
			System.out.format("Head: %d\n", stuff.getHead());
			System.out.format("Tail: %d\n", stuff.getTail());
			System.out.format("Size: %d\n", stuff.getSize());
			stuff.insertFront(99);
			stuff.insertEnd(10);
			System.out.format("Head: %d\n", stuff.getHead());
			System.out.format("Tail: %d\n", stuff.getTail());
			System.out.format("Size: %d\n", stuff.getSize());
			Integer v = stuff.removeFront();
			System.out.format("Size: %d\n", stuff.getSize());
			System.out.format("Head: %d\n", stuff.head.getContent());
			Integer w = stuff.removeEnd();
			System.out.format("Size: %d\n", stuff.getSize());
			System.out.format("Front Pop: %d\n", v);
			System.out.format("Rear Pop: %d\n", w);
			System.out.format("Head: %d\n", stuff.getHead());
			System.out.format("Tail: %d\n", stuff.getTail());
		}
	}
}