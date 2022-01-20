with GNAT.Sockets; use GNAT.Sockets;

with Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;

procedure server is
    Address : Sock_Addr_Type;
    Server  : Socket_Type;
    Socket  : Socket_Type;
    Channel : Stream_Access;
begin
    Initialize (Process_Blocking_IO => False);
    Address.Addr := Addresses (Get_Host_By_Name (Host_Name), 1);
    Address.Port := 1_024;

    Create_Socket (Server);
    Set_Socket_Option (Server, Socket_Level, (Reuse_Address, True));
    Bind_Socket (Server, Address);
    Listen_Socket (Server);
    Accept_Socket (Server, Socket, Address);

    Channel := Stream (Socket);

    delay 0.2;

    declare
        Message : String := String'Input (Channel);
    begin
        Ada.Text_IO.Put_Line (Message);

        String'Output (Channel, Message);
    end;

    Close_Socket (Server);
    Close_Socket (Socket);
end server;
