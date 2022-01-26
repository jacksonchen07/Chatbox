with Ada.Containers.Indefinite_Hashed_Maps;
with Ada.Strings.Hash;
with Ada.Strings.Hash_Case_Insensitive;
with Ada.Strings.Equal_Case_Insensitive;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Directories; use Ada.Directories;

procedure Profanity_Filter is

   Was_Initialized : boolean := false;
   
   package Profane_Hashed_Map is new
     Ada.Containers.Indefinite_Hashed_Maps
       (Key_Type        => String,
        Element_Type    => String,
        Hash            => Ada.Strings.Hash_Case_Insensitive,
        Equivalent_Keys => Ada.Strings.Equal_Case_Insensitive);

   use Profane_Hashed_Map;
   Profane_Words : Profane_Hashed_Map.Map;

   procedure Initialize is
      File : File_Type;
   begin
      
      if not Was_Initialized then 
         Put_Line("Initializing the profane_words hash map.");
         Open (File => File,
            Mode => In_File,
            --this probably needs to be passed in, but hardcoding for now. 
            Name => ".\source\server\profane_words.txt");
         
         While not  End_Of_File (File) Loop
            Profane_Words.Include(New_Item => "@#$#&^*%",  --Need a function to take the word, and return obfuscated that matches length.    
                           Key => Get_Line (File));
         end loop;
   
         Close (File);

         Was_Initialized := True;
      end if;
   end Initialize;

   procedure Print_Hash_Map(Position : Profane_Hashed_Map.Cursor) is                ---
   begin
      --Put_Line("Key = " & Profane_Hashed_Map.Key(Position) & 
              -- " -- Element = " & Profane_Hashed_Map.Element(Position)); 

      Put_Line(Profane_Hashed_Map.Key(Position));
   end Print_Hash_Map;

   function Obfuscate_Token(Input_String : String) return String is
   begin

      if not Was_Initialized then 
         Initialize;
      end if;

      declare 
         Cursor : constant Profane_Hashed_Map.Cursor :=
            Profane_Hashed_Map.Find (Key => Input_String,
                                     Container => Profane_Words);
      begin
         if Has_Element (Cursor) then 
            return Element(Cursor);
         else
            return Input_String;
         end if;
      end;
   end Obfuscate_Token;

begin
   Initialize;
   
   --uncomment to print the hashmap. 
   --Profane_Words.Iterate(Print_Hash_Map'access);

   Put_Line("OBfuscated? " & Obfuscate_Token(Input_String => "FUCK"));
end Profanity_Filter;