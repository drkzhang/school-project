
/* this program is adapted from the skeleton program on the assignment webpage:http://www.eecs.yorku.ca/course_archive/2016-17/W/3214/ASSGMTS/EchoClient.java
 * author:jingmian zhang 213568993
 */

import java.io.*;
import java.net.*;

public class EchoClient {
	public static void main(String[] args) throws IOException {

		/*
		 * if (args.length != 2) { System.err.println(
		 * "Usage: java EchoClient <host name> <port number>"); System.exit(1);}
		 * 
		 * 
		 * String hostName = args[0]
		 * String portNumber = Integer.parseInt(args[1]);
		 */
	

		String hostName = "127.0.0.1";// ip address for the server
		int portNumber = 28993;// the port number of the server

		try {
			Socket clientSocket = new Socket(hostName, portNumber);
			// create a simple socket to connect client to server
			PrintWriter output = new PrintWriter(clientSocket.getOutputStream(), true);
			// create an output for the client to pass information to the server
			BufferedReader input = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
			/*
			 * create an input for the client to obtain information from the
			 * server can also use scanner object
			 */
			BufferedReader stdIn = new BufferedReader(new InputStreamReader(System.in));
			// create an input that reads from the user
			String userInput;
			while ((userInput = stdIn.readLine()) != null) {// user input loop
				output.println(userInput);// pass information from user input to
											// the server
				System.out.println("echo: " + input.readLine());
				// output information that is obtained from the server´

			}
			clientSocket.close();// close socket
			System.out.print("Connection ends");// close connection
		} catch (UnknownHostException e) {
			System.err.println("Don't know about host " + hostName);// unknown
																	// hostname
																	// error
			System.exit(1);
		} catch (IOException e) {// server error
			System.err.println("Couldn't get I/O for the connection to " + hostName);
			System.exit(1);
		}
	}
}
