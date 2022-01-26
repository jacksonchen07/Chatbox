with GNAT.Sockets;   use GNAT.Sockets;
with Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;

procedure server is
    Address   : Sock_Addr_Type;
    Server    : Socket_Type;
    Channel   : Stream_Access;
    Socket    : Socket_Type;
    Connected : Integer := 0;

    task type Client_Connect is
        entry Start (Socket : Socket_Type; Channel : Stream_Access);
    end Client_Connect;

    Task_Array : array (1 .. 10) of Client_Connect;

    task body Client_Connect is
    begin
        accept Start (Socket : Socket_Type; Channel : Stream_Access);
        Ada.Text_IO.Put_Line ("Connected...");
        while True loop
            declare
                Message : String :=
                   String'Input
                      (Channel); -- Recieves message from associated socket
            begin
                Address := Get_Address (Channel);
                Ada.Text_IO.Put_Line (Message & " from " & Image (Address));
                -- Ada.Text_IO.Put_Line (Message);
                -- Send same message back to associated socket
                String'Output (Channel, "Message recieved");
            end;
        end loop;
        Ada.Text_IO.Put_Line ("Disconnected...");
    end Client_Connect;

begin
    Initialize
       (Process_Blocking_IO => False); -- Must be called before socket routine
    Address.Addr := -- Get internet address of host. (Localhost here)
       Addresses (Get_Host_By_Name (Host_Name), 1);
    Address.Port := 1_024;

    Create_Socket
       (Server); -- Socket will need to be associated with an address on server sockets
    Set_Socket_Option (Server, Socket_Level, (Reuse_Address, True));
    Bind_Socket (Server, Address); -- Bind Socket

    while True loop
        Ada.Text_IO.Put_Line ("Listening for sockets...");
        Listen_Socket (Server); -- Start listening for any incoming sockets
        Accept_Socket (Server, Socket, Address); -- Accept any incoming sockets
        Channel :=
           Stream (Socket); -- Returns a stream from the incoming socket
        delay 0.2;
        Connected := Connected + 1;
        Ada.Text_IO.Put_Line
           ("There are now" & Integer'Image (Connected) &
            " clients connected.");

        -- Start a thread
        Task_Array (Connected).Start (Socket, Channel);
        -- Client_Connect.Start (Socket, Channel);
    end loop;

    Ada.Text_IO.Put_Line ("Closing Socket...");
    Close_Socket (Server);
    Close_Socket (Socket);
    Finalize;
end server;
