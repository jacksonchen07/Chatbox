with GNAT.Sockets; use GNAT.Sockets;

with Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;

with Ada.Numerics.Discrete_Random;

procedure server is
    Address : Sock_Addr_Type;
    Server  : Socket_Type;
    Socket  : Socket_Type;
    Channel : Stream_Access;

    subtype randRange is Integer range 1 .. 2;
    package Rand_Int is new Ada.Numerics.Discrete_Random (randRange);
    use Rand_Int;
    gen : Generator;
    num : Integer;

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
    Listen_Socket (Server); -- Start listening for any incoming sockets
    Accept_Socket (Server, Socket, Address); -- Accept any incoming sockets

    Channel := Stream (Socket); -- Returns a stream from the incoming socket

    delay 0.2;

    -- declare
    --     -- Recieves message from associated socket
    --     Message : String := String'Input (Channel);
    -- begin
    --     -- Ada.Text_IO.Put_Line (Message);

    --     -- Send same message back to associated socket
    --     -- String'Output (Channel, "Hello Socket World, Client!");

    --     -- Close_Socket (Server);
    --     -- Close_Socket (Socket);
    -- end;

    loop
        String'Output (Channel, "Ask me a Y/N question or type stop");
        -- Ada.Text_IO.Put_Line (String'Input (Channel));
        declare
            -- Recieves message from associated socket
            Message : String := String'Input (Channel);
        begin
            Reset (gen);
            num := Random (gen);

            if num = 1 then
                String'Output (Channel, "Yes");
            else
                String'Output (Channel, "No");
            end if;
        
        Ada.Text_IO.Put_Line (Message);
        end;

        delay 0.2;

    end loop;

end server;
