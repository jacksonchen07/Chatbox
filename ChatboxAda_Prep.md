ChatBox Ada
Purpose: Connect terminals to chat with each other.

Need:
- Implement server that is always listening
- Multiple clients (Concurrency)
- Add ability to send usernames from client, and store them on the server to be retrieved. (flat file possibly?)
- Communication System
- Login System
- Profanity Filter (Ben)
    - Write function that takes a string, and returns a obfuscated representation of that string if it contains profanity.
- Store chat history in log. 


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


Process
1. Create a socket for the server to recieve and send (Get an IP address, Port, etc..)
2. Have a client create a socket to connect to server to start recieving and sending
3. Once connected, prompt user to create a username and run it thorugh a data structure to see if it is taken or not
4. Client should be able to type a message and send it to the server to brodcast to other clients
5. Other clients receive message
6. When client disconnects remove from list of connected sockets and leave a message.
