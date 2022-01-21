-- Examples and useage of sockets in Ada https://en.wikibooks.org/wiki/Ada_Programming/Libraries/GNAT.Sockets
-- https://rosettacode.org/wiki/Sockets#Ada

with GNAT.Sockets; use GNAT.Sockets;
with Ada.Text_IO;

procedure client is
    Client  : Socket_Type;
    Address : Sock_Addr_Type;
    Channel : Stream_Access;
begin
    Initialize; -- Must be called before socket routine
    Address.Addr := Addresses (Get_Host_By_Name (Host_Name), 1);
    Address.Port := 1_024;
    Create_Socket (Socket => Client);

    delay 0.2;

    Connect_Socket
       (Client,
        Address); -- Connect and Autmoatically bind to an address since localhost is the server
    Channel := Stream (Client); -- Stream associated to the socket
    String'Output
       (Channel, "Hello Socket World, Server!"); -- Sends message to stream
    delay 0.2;

    Ada.Text_IO.Put_Line
       (String'Input (Channel)); -- Prints any message recevied by server
    delay 0.2; 
    
    String'Output
        (Channel, "How are you doing?"); 
    delay 0.2;
    
    Ada.Text_IO.Put_Line
        (String'Input(Channel)); 
    delay 0.2; 
    
    String'Output 
        (Channel, "I'm great. Thanks for asking!"); 
        
    
    Close_Socket (Client);
end client;
