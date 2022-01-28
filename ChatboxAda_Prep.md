ChatBox Ada
Purpose: Connect terminals to chat with each other.

Need:
- A server == COMPLETED
- Multiple clients == COMPLETED
- Store chat history(?) through a hashmap (not secure but OK for starting)
- Maybe not a log in system, but just a username upon connecting
- Communication System
- Login System

Features:
- Create unique username
- Show time of sent message
- Show whos in the chat room

Possible:
- Multiple chat rooms(?)

Packages to use:
- GNAT.Sockets for sockets: 
    https://en.wikibooks.org/wiki/Ada_Programming/Libraries/GNAT.Sockets 
    https://rosettacode.org/wiki/Sockets#Ada 

- Task type for Ada:
    https://learn.adacore.com/courses/Ada_For_The_CPP_Java_Developer/chapters/11_Concurrency.html

- For Date and time:
    https://learn.adacore.com/courses/intro-to-ada/chapters/standard_library_dates_times.html

Ideas that are implemented:
- Sockets
- Concurrency (Threads)

Process
1. Create a socket for the server to recieve and send (Get an IP address, Port, etc..) == COMPLETED
2. Have a client create a socket to connect to server to start recieving and sending == COMPLETED
3. Once connected, prompt user to create a username and run it thorugh a data structure to see if it is taken or not
4. Client should be able to type a message and send it to the server to brodcast to other clients
5. Other clients receive message
6. When client disconnects remove from list of connected sockets and leave a message.
