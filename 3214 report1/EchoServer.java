
/*
 /* this program is adapted from the skeleton program on the assignment webpage:http://www.eecs.yorku.ca/course_archive/2016-17/W/3214/ASSGMTS/EchoServer.java
 *  as well as from http://www.java2s.com/Tutorial/Java/0320__Network/AmultithreadedSocketServer.htm the multithead server example
 *   author:jingmian zhang 213568993
 */
import java.net.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.io.*;

public class EchoServer {
	static ArrayList<Integer> list = new ArrayList<Integer>();//arraylist for storing the list of port numbers for users

	public static void main(String[] args) throws IOException {

		// if (args.length != 1) {
		// System.err.println("Usage: java EchoServer <port number>");
		// System.exit(1);
		// }
		//
		// int portNumber = Integer.parseInt(args[0]);
		//
		int portNumber = 28993;// port number
		
		boolean run = true;// status of the server
	
		try {

			ServerSocket serverSocket = new ServerSocket(portNumber);//create a serversocket
			System.err.println("SERVER is ON and the port number is: " + portNumber);//display to user that server socket is instantiated successfully
			while (run) {
				Socket clientSocket = serverSocket.accept();//accept connection and listen for client to connect
				new Thread(new MyThread(clientSocket)).start();// create a new thread to serve the client
				System.out.println("Someone Connected:" + clientSocket.getInetAddress() + ":" + clientSocket.getPort());//display status
			}

		} catch (IOException e) {//catch server exception
			System.out.println(
					"Exception caught when trying to listen on port " + portNumber + " or listening for a connection");
			System.out.println(e.getMessage());
		}
	}
}
