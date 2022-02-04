with GNAT.Sockets;            use GNAT.Sockets;
with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Command_Line;        use Ada.Command_Line;
with Ada.Strings.Unbounded;   use Ada.Strings.Unbounded;
with Ada.Containers.Vectors;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;
with Ada.Calendar;            use Ada.Calendar;
with Ada.Calendar.Formatting; use Ada.Calendar.Formatting;

procedure Server is
    Address       : Sock_Addr_Type;
    Server        : Socket_Type;
    Client_Socket : Socket_Type;

    package Client_Vectors is new Ada.Containers.Vectors
       (Element_Type => Socket_Type, Index_Type => Positive);
    Clients : Client_Vectors.Vector;

    package Username_Vectors is new Ada.Containers.Vectors
       (Element_Type => Unbounded_String, Index_Type => Positive);
    Client_Usernames : Username_Vectors.Vector;

    procedure Broadcast (Sock : Socket_Type; Message : String) is
        Channel         : Stream_Access;
        Now             : Time := Clock; -- gets current time
        Current_Year    : Year_Number;
        Current_Month   : Month_Number;
        Current_Day     : Day_Number;
        Current_Seconds : Day_Duration;
        Hour            : Hour_Number;
        Minute          : Minute_Number;
        Second          : Second_Number;
        Sub_Second      : Second_Duration;
    begin
        Split (Now, Current_Year, Current_Month, Current_Day, Current_Seconds);
        Split (Current_Seconds, Hour, Minute, Second, Sub_Second);

        for Socket of Clients loop
            if Sock /= Socket then
                Channel := Stream (Socket);
                String'Output
                   (Channel,
                    "[" & Integer'Image (Hour) (2 .. 3) & (":") &
                    Integer'Image (Minute) (2 .. 3) & "]" & (" ") & Message);
            end if;
        end loop;
    end Broadcast;

    task type Client_Task is
        entry Start (Socket : Socket_Type);
    end Client_Task;

    task body Client_Task is
        Sock     : Socket_Type;
        Channel  : Stream_Access;
        Username : Unbounded_String;
    begin
        accept Start (Socket : Socket_Type) do
            Sock := Socket;
        end Start;

        Put_Line ("Client connected...");
        Clients.Append (Sock);
        Channel := Stream (Sock);

        -- Add client's username to another vector
        Username := To_Unbounded_String (Source => String'Input (Channel));
        Client_Usernames.Append (Username);
        Put_Line ("Username stored");

        loop
            declare
                -- Recieves message from associated socket
                Message : String := String'Input (Channel);
            begin
                Put_Line ("Recieved message");
                Address := Get_Address (Channel);
                Broadcast (Sock, To_String (Username) & ": " & Message);
            end;
        end loop;
    end Client_Task;

    type Client_Access is access Client_Task;
    Client_Instance : Client_Access;

begin
    -- Get port from user
    if Argument_Count = 0 then
        Put_Line (Current_Error, "Error - No port was given.");
        Set_Exit_Status (Failure);
    elsif Argument_Count > 1 then
        Put_Line (Current_Error, "Error - Please only put one argument");
        Set_Exit_Status (Failure);
    else
        -- Must be called before socket routine
        Initialize (Process_Blocking_IO => False);

        -- Get internet address of host. (Localhost here)
        Address.Addr := Addresses (Get_Host_By_Name (Host_Name), 1);
        Address.Port := Port_Type (Integer'Value (Argument (1)));

        -- Socket will need to be associated with an address on server sockets
        Create_Socket (Server);
        Set_Socket_Option (Server, Socket_Level, (Reuse_Address, True));
        Bind_Socket (Server, Address); -- Bind Socket
        Listen_Socket (Server); -- Start listening for any incoming sockets

        loop
            Put_Line ("Accepting new sockets...");

            -- Accept any incoming sockets
            Accept_Socket (Server, Client_Socket, Address);
            delay 0.2;

            -- Start a new task for a new client
            Client_Instance := new Client_Task;
            Client_Instance.Start (Client_Socket);
        end loop;
    end if;

    -- Put_Line ("Closing Socket...");
    -- Close_Socket (Server);
    -- Close_Socket (Socket);
    -- Finalize;
end Server;
