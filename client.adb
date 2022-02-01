with Ada.Strings;
with GNAT.Sockets;           use GNAT.Sockets;
with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Characters.Latin_1; use Ada.Characters.Latin_1;

procedure Client is
    Client  : Socket_Type;
    Address : Sock_Addr_Type;
    -- Key     : Character;

    -- Recieving msg task --
    task Rec_Msg is
        entry Start (Socket : Socket_Type);
    end Rec_Msg;

    task body Rec_Msg is
        Sock    : Socket_Type;
        Channel : Stream_Access;
    begin

        accept Start (Socket : Socket_Type) do
            Sock := Socket;
        end Start;

        Channel := Stream (Sock);

        loop
            Put_Line (String'Input (Channel));
        end loop;

    end Rec_Msg;

    -- Sending msg task --
    task Send_Msg is
        entry Start (Socket : Socket_Type);
    end Send_Msg;

    task body Send_Msg is
        Sock    : Socket_Type;
        Channel : Stream_Access;
    begin

        accept Start (Socket : Socket_Type) do
            Sock := Socket;
        end Start;

        Channel := Stream (Sock);

        loop
            declare
                User_Input : String := Get_Line;
            begin
                -- exit when End_Of_File;
                String'Output (Channel, User_Input); -- Sends message to stream
            end;
        end loop;
    end Send_Msg;

    -- -- Detecting if user exited group chat --
    -- task Check_End;

    -- task body Check_End is
    -- begin
    --     loop
    --         Get_Immediate (Key);
    --         if Key = ESC then
    --             Put_Line ("Closing Socket...");
    --             Close_Socket (Client);
    --             Finalize;
    --             exit;
    --         end if;
    --     end loop;
    -- end Check_End;
begin

    Initialize; -- Must be called before socket routine
    Address.Addr := Addresses (Get_Host_By_Name (Host_Name), 1);
    Address.Port := 1_024;
    Create_Socket (Socket => Client);

    -- Connect and Autmoatically bind to an address since localhost is the server
    Connect_Socket (Client, Address);

    --Start Recieving and sending tasks
    Rec_Msg.Start (Client);
    Send_Msg.Start (Client);
end Client;
