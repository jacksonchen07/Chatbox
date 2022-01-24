-- Examples and useage of sockets in Ada https://en.wikibooks.org/wiki/Ada_Programming/Libraries/GNAT.Sockets
-- https://rosettacode.org/wiki/Sockets#Ada

with GNAT.Sockets; use GNAT.Sockets;
with Ada.Text_IO;

procedure client is
    Client  : Socket_Type;
    Address : Sock_Addr_Type;
    Channel : Stream_Access;
    User_Input : String(1..2) := (others => ' ');-- takes input for the string 
begin
    Ada.Text_IO.Put_Line ("Pease enter a number 1-5");
    Get(User_Input);

    Initialize; -- Must be called before socket routine
    Address.Addr := Addresses (Get_Host_By_Name (Host_Name), 1);
    Address.Port := 1_024;
    Create_Socket (Socket => Client);
    
    
    


    delay 0.2;
    


    Connect_Socket
       (Client,
        Address); -- Connect and Autmoatically bind to an address since localhost is the server
    Channel := Stream (Client); -- Stream associated to the socket
    
    

    
    If  User_Input = '1' then -- added if loop to check for valid input
    String'Output
       (Channel, User_input); -- Sends message to stream (Modifed this so it sends user Input)
    delay 0.2;

    Ada.Text_IO.Put_Line
       (String'Input (Channel)); 
    
    elsif  User_Input = '2' then
    String'Output
       (Channel, User_Input); 
    delay 0.2;

    Ada.Text_IO.Put_Line
       (String'Input (Channel)); 
     
    elsif  User_Input = '3' then
    String'Output
       (Channel, User_Input); 
    delay 0.2;

    Ada.Text_IO.Put_Line
       (String'Input (Channel)); 


    elsif  User_Input = '4'
    then
    String'Output
       (Channel, User_Input); 
    delay 0.2;

    Ada.Text_IO.Put_Line
       (String'Input (Channel)); 
       
           elsif Input = '5' then
    String'Output
       (Channel, User_Input); 
    delay 0.2;

    Ada.Text_IO.Put_Line
       (String'Input (Channel)); 
  else
  Ada.Text_IO.Put_Line  ("Error invalid Input"); -- invalid input error
  end if;
  
    Close_Socket (Client);
end client;
