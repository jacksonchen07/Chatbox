-- Examples and useage of sockets in Ada https://en.wikibooks.org/wiki/Ada_Programming/Libraries/GNAT.Sockets
-- https://rosettacode.org/wiki/Sockets#Ada

with GNAT.Sockets; use GNAT.Sockets;
with Ada.Text_IO;  use Ada.Text_IO;
with Ada.Integer_Text_IO;

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

    -- Connect and Autmoatically bind to an address since localhost is the server
    Connect_Socket (Client, Address);

    Set (RSet, Client);
    Set (WSet, Client);
    Channel := Stream (Client); -- Stream associated to the socket
    Create_Selector (Selector);

    loop
    -- *****@@@@ USE THREADS TO CREATE A TASK FOR MESSAGES GOING IN AND TASK FOR MESSAGES GOING OUT*****@@@@@
    -- declare
    --     User_Input : String := Get_Line;
    -- begin
    --     String'Output (Channel, User_Input); -- Sends message to stream
    -- end;

    -- delay 0.2;
    -- -- Prints any message recevied by server
    -- Put_Line (String'Input (Channel));
    end loop;

    -- Put_Line ("Closing Socket...");
    -- Close_Socket (Client);
    -- Finalize;
end client;
