with GNAT.Sockets; use GNAT.Sockets;
with Ada.Text_IO;

procedure client is
    Client  : Socket_Type;
    Address : Sock_Addr_Type;
    Channel : Stream_Access;
begin
    Initialize;
    Address.Addr := Addresses (Get_Host_By_Name (Host_Name), 1);
    Address.Port := 1_024;
    Create_Socket (Socket => Client);

    delay 0.2;

    Connect_Socket (Client, Address);
    Channel := Stream (Client);
    String'Output (Channel, "Hello Socket World");
    delay 0.2;

    Ada.Text_IO.Put_Line (String'Input (Channel));

    Close_Socket (Client);
end client;
