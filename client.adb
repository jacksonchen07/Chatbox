with GNAT.Sockets; use GNAT.Sockets;
with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure client is
   User_Input : String (1 .. 256);-- takes input for the string
   Client     : Socket_Type;
   Address    : Sock_Addr_Type;
   Channel    : Stream_Access;

begin
   -- Ada.Text_IO.Get (User_Input);

   Initialize; -- Must be called before socket routine
   Address.Addr := Addresses (Get_Host_By_Name (Host_Name), 1);
   Address.Port := 1_024;
   Create_Socket (Socket => Client);

   delay 0.2;

   Connect_Socket
     (Client,
      Address); -- Connect and Autmoatically bind to an address since localhost is the server
   Channel := Stream (Client); -- Stream associated to the socket
   loop
      Ada.Text_IO.Put_Line
      (String'Input (Channel)); -- Prints any message recevied by server

      Ada.Text_IO.Get (User_Input);
      String'Output (Channel, User_Input); -- Sends message to stream
      delay 0.2;

      -- Ada.Text_IO.Put_Line
      -- (String'Input (Channel)); -- Prints any message recevied by server
   end loop;

   -- Close_Socket (Client);
end client;
