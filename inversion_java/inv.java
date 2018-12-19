import java.io.*;
import java.util.*;

public class inv {

	public static void main(String[] args) {
		MyLinkedList inputList = new MyLinkedList();// create new input list
		System.out.println("Please enter a list of integers ");// prompt user to enter integers
		String inputa = null;						
		Scanner reader = new Scanner(System.in);// scanner input
		
			 inputa = reader.nextLine();
		
	//	inputList.addtoList(reader.nextInt());// add integer to linkedlist
		
			 String[] s=inputa.split("\\s+");//split string by space and store them in an array
			 for(int i =0; i < s.length;i++)
			 {
				 inputList.addtoList(Integer.parseInt(s[i]));//convert char to integer and add them to list
			 }
			 inputList.reverse(inputList.head);// reverse the list
			 inputList.printList(inputList.head);// print the reversed list
	}
	
}

class Node { // node class within the linkedlist structure
	public int data;
	public Node next;

	public Node(int data) { // constructor
		this.data = data;
		this.next = null;
	}

}

class MyLinkedList { // mylinkedlist class
	public Node head;// head pointing to the first of the list

	public MyLinkedList() {
		head = null;// initialize head to null
	}

	public void addtoList(int data) {
		Node n = new Node(data); // create a new node
		if (head == null)/* if list does not exist yet, make the new node a
							 head */
		{
			head = n;
			return;// break out of loop and return the function
		}

		Node temp = head; // if list already exists, start traversing the list s
		while (temp.next != null) {//traverse list till the end of the list
			temp = temp.next;
		}
		temp.next = n;//set the next element of end of the list to the new node
		return;
	}

	public void reverse(Node node) {
		Node currNode = node;//make three pointers, currNode, nextNode and preNode
		Node nextNode = null;
		Node prevNode = null;

		while (currNode != null) {//traverse the list till currNode is null
			nextNode = currNode.next;//keep reference to the next node of currNode
			currNode.next = prevNode;//move next pointer of currNode to prevNode
			prevNode = currNode;//proceed pointer to the next node
			currNode = nextNode;//proceed pointer to the next node

		}
		this.head = prevNode;//now prevNode points to the originally last element of list, currNode is null
								//So make the prevNode a new head

	}

	void printList(Node node) {
		while (node != null) {//traverse the list
			System.out.print(node.data + " ");
			node = node.next;
		}
	}

}
