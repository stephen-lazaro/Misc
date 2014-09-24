//Circularly Linked List
//Finis, appears to work
public class CircularlyLinkedList<E> {
	private static boolean debuga = true;
	private Node<E> tail;
	private int size;

	private static class Node<E> {
		private Node<E> next;
		private E data;

		public Node(E content, Node<E> later) {
			this.next = later;
			this.data = content;
		}
		//Getters
		public Node<E> getNext() {
			return this.next;
		}
		public E getContent() {
			return this.data;
		}
		//Setters
		public void setNext(E content) {
			this.next = new Node<E>(content, null);
		}
		public void setNext(Node<E> later) {
			this.next = later;
		}
		public void insertBetween(E content) {
			Node<E> temp = new Node<E>(content, this.next);
			this.next = temp;
		}
	}

	public CircularlyLinkedList() {
		this.size = 0;
	}

	public CircularlyLinkedList(E data) {
		Node<E> temp = new Node<E>(data, null);
		temp.next = temp;
		this.tail = temp;
		this.size = 1;
	}
	//Getters
	public boolean isEmpty() {
		if (this.size == 0) {
			return true;
		} else {
			return false;
		}
	}
	public E getHead() {
		if (this.isEmpty()) {
			return null;
		}
		return this.tail.getNext().getContent();
	}
	public E getTail() {
		return this.tail.getContent();
	}
	public int getSize() {
		return this.size;
	}
	//Setters
	public void insert(E data) {
		if (this.isEmpty()) {
			Node<E> temp = new Node<E>(data, null);
			temp.next = temp;
			this.tail = temp;
			this.size++;
		} else {
			this.tail.insertBetween(data);
			this.size++;
		}
	}
	//Mutator/logic
	public void rotate(E data) {
		this.tail = this.tail.getNext();
	}
	public E removeHead() {
		E temp = this.tail.getNext().getContent();
		this.tail.setNext(this.tail.getNext().getNext());
		this.size--;
		return temp;
	}
	public static void main(String[] args) {
		if (debuga == true) {
			//Inner Node class tests
			Node<Integer> thing = new Node<Integer>(5, null);
			System.out.format("Head: %d\n", thing.getContent());
			thing.setNext(15);
			System.out.format("Head: %d\n", thing.getContent());
			System.out.format("Next: %d\n", thing.getNext().getContent());
			thing.insertBetween(12);
			System.out.format("Next: %d\n", thing.getNext().getContent());
			System.out.format("NextNext: %d\n", thing.getNext().getNext().getContent());
			thing.setNext(77);
			System.out.format("Next: %d\n", thing.getNext().getContent());
			System.out.format("NextNext: %d\n", thing.getNext().getNext());
			//CircularlyLinkedList tests
			CircularlyLinkedList<Integer> stuff = new CircularlyLinkedList<Integer>(23);
			CircularlyLinkedList<Integer> stuff2 = new CircularlyLinkedList<Integer>();
			System.out.format("Head1: %d\n", stuff.getHead());
			System.out.format("Head2: %d\n", stuff2.getHead());
			System.out.format("Size1: %d\n", stuff.getSize());
			System.out.format("Size2: %d\n", stuff2.getSize());
			stuff.insert(55);
			stuff2.insert(66);
			System.out.format("Insert1 Head: %d\n", stuff.getHead());
			System.out.format("Insert1 Tail: %d\n", stuff.getTail());
			System.out.format("Insert2 Head: %d\n", stuff2.getHead());
			System.out.format("Insert2 Tail: %d\n", stuff2.getTail());
			System.out.format("Size1: %d\n", stuff.getSize());
			System.out.format("Size2: %d\n", stuff2.getSize());
			Integer v = stuff.removeHead();
			System.out.format("Removed: %d\n", v);
			System.out.format("Head: %d\n", stuff.getHead());
		}
	}
}