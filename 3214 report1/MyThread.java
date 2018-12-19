import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

class MyThread implements Runnable {
	Socket socket;

	public MyThread(Socket socket) {//constructor for mythread
		this.socket = socket;
	}

	public void run() {
		String clientInput;

		try {
			PrintWriter output = new PrintWriter(socket.getOutputStream(), true);//create output to client
			BufferedReader input = new BufferedReader(new InputStreamReader(socket.getInputStream()));//create input from client

			while ((clientInput = input.readLine()) != null) {
				if (clientInput.equalsIgnoreCase("join")) { //receive join request
					if (EchoServer.list.contains(socket.getPort())) {//if port number of client is already on the list, notice that he has joined before
						System.out.println("IP:" + socket.getInetAddress() + " Port: " + socket.getPort()
								+ " already joined before");
						output.println("already joined before");
					} else {
						System.out.println("IP:" + socket.getInetAddress() + " Port: " + socket.getPort()//display in server
								+ " successfully joined");
						output.println("join succeeded");//notice client
						EchoServer.list.add(socket.getPort());// proceed join process
					}

				} else if (clientInput.equalsIgnoreCase("list")) {//receive list request
					if (EchoServer.list.isEmpty()) {

						output.println("List is empty!");//notice client list is empty
					} else {
						StringBuffer sb = new StringBuffer();// concatenate all port numbers of clients in the list and output them to the client.
						for (Integer number : EchoServer.list) {
							System.out.println("Player Number = " + number);
							sb.append(number);
							sb.append("\t");
						}
						String temp = sb.toString();
						output.println(temp);
					}

				} else if (clientInput.equalsIgnoreCase(//receive leave request
						"leave") ) {
					if (!EchoServer.list.contains(socket.getPort())) {////if port number of client is not on the list, notice that he has left before
						System.out.println(
								"User:" + socket.getInetAddress() + ":" + socket.getPort() + " already left before");
						output.println("already left before");
					} else {                                            
						System.out.println(
								"User:" + socket.getInetAddress() + ":" + socket.getPort() + " leaves the list");//display in server
						output.println("leave succeeded");//notice client
						EchoServer.list.remove(new Integer(socket.getPort()));// proceed leave process
					}
				} else if (clientInput.equalsIgnoreCase("quit")) {//receive quit request
					System.out.println("User:" + socket.getInetAddress() + ":" + socket.getPort() + " quit");//display in server
					output.println("quit succeeded");//notice client
					break;// cease the client input
				} else {
					output.println("Wrong input.Enter JOIN, LEAVE, LIST or QUIT");// wrong input symbols, notice client and display in server
					System.out.println("IP:" + socket.getInetAddress() + " Port: " + socket.getPort() + " Wrong input: "
							+ clientInput);
				}

			}
			socket.close();//close the socket

		} catch (Exception e) {
			System.out.println("ioexception:" + e);
		}
	}

}
