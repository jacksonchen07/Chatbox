with Ada.Text_IO;
with Ada.Strings.Unbounded;
with ada.Text_IO.Unbounded_IO;

procedure Report is
 User_Input : Ada.Strings.Unbounded.Unbounded_String; 

  use Ada.Text_IO;


   F : File_Type;

begin
    Put_Line ("Please enter your report:  ");
    User_Input  := ada.Text_IO.Unbounded_IO.Get_Line; 
   Create (F, Out_file, "Report.txt");

      Put_Line (F, Ada.Strings.Unbounded.To_String(User_Input));
 
 
   Close (F);
   Put_Line ("Thank you for your report!");
end Report;

