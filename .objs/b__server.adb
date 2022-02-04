pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__server.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__server.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E010 : Short_Integer; pragma Import (Ada, E010, "ada__exceptions_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__soft_links_E");
   E027 : Short_Integer; pragma Import (Ada, E027, "system__exception_table_E");
   E029 : Short_Integer; pragma Import (Ada, E029, "system__exceptions_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__soft_links__initialize_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "ada__containers_E");
   E061 : Short_Integer; pragma Import (Ada, E061, "ada__io_exceptions_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "ada__numerics_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "ada__strings_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "ada__strings__utf_encoding_E");
   E089 : Short_Integer; pragma Import (Ada, E089, "gnat_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "interfaces__c_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "interfaces__c__strings_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "system__os_lib_E");
   E063 : Short_Integer; pragma Import (Ada, E063, "ada__tags_E");
   E060 : Short_Integer; pragma Import (Ada, E060, "ada__streams_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "ada__strings__text_output_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "system__file_control_block_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "system__finalization_root_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "ada__finalization_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "system__file_io_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "system__storage_pools_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "system__finalization_masters_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "system__storage_pools__subpools_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__calendar_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__calendar__delays_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "ada__text_io_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "ada__strings__maps_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "ada__strings__unbounded_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "system__pool_global_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "gnat__sockets_E");
   E095 : Short_Integer; pragma Import (Ada, E095, "gnat__sockets__poll_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "gnat__sockets__thin_common_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "gnat__sockets__thin_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "system__random_seed_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "gnat__sockets__finalize_body");
      begin
         E091 := E091 - 1;
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "gnat__sockets__finalize_spec");
      begin
         F2;
      end;
      E120 := E120 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__pool_global__finalize_spec");
      begin
         F3;
      end;
      E131 := E131 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "ada__strings__unbounded__finalize_spec");
      begin
         F4;
      end;
      E075 := E075 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "ada__text_io__finalize_spec");
      begin
         F5;
      end;
      E124 := E124 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__storage_pools__subpools__finalize_spec");
      begin
         F6;
      end;
      E112 := E112 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "system__finalization_masters__finalize_spec");
      begin
         F7;
      end;
      declare
         procedure F8;
         pragma Import (Ada, F8, "system__file_io__finalize_body");
      begin
         E080 := E080 - 1;
         F8;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E027 := E027 + 1;
      System.Exceptions'Elab_Spec;
      E029 := E029 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E023 := E023 + 1;
      E015 := E015 + 1;
      E010 := E010 + 1;
      Ada.Containers'Elab_Spec;
      E092 := E092 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E061 := E061 + 1;
      Ada.Numerics'Elab_Spec;
      E058 := E058 + 1;
      Ada.Strings'Elab_Spec;
      E129 := E129 + 1;
      Ada.Strings.Utf_Encoding'Elab_Spec;
      E142 := E142 + 1;
      Gnat'Elab_Spec;
      E089 := E089 + 1;
      Interfaces.C'Elab_Spec;
      E055 := E055 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E105 := E105 + 1;
      System.Os_Lib'Elab_Body;
      E085 := E085 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E063 := E063 + 1;
      Ada.Streams'Elab_Spec;
      E060 := E060 + 1;
      Ada.Strings.Text_Output'Elab_Spec;
      E140 := E140 + 1;
      System.File_Control_Block'Elab_Spec;
      E088 := E088 + 1;
      System.Finalization_Root'Elab_Spec;
      E083 := E083 + 1;
      Ada.Finalization'Elab_Spec;
      E081 := E081 + 1;
      System.File_Io'Elab_Body;
      E080 := E080 + 1;
      System.Storage_Pools'Elab_Spec;
      E118 := E118 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E112 := E112 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E124 := E124 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E008 := E008 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E006 := E006 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E075 := E075 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E135 := E135 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E131 := E131 + 1;
      System.Pool_Global'Elab_Spec;
      E120 := E120 + 1;
      Gnat.Sockets'Elab_Spec;
      Gnat.Sockets.Thin_Common'Elab_Spec;
      E103 := E103 + 1;
      E097 := E097 + 1;
      Gnat.Sockets'Elab_Body;
      E091 := E091 + 1;
      E095 := E095 + 1;
      System.Random_Seed'Elab_Body;
      E166 := E166 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_server");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /Users/jacksonchen/Desktop/AdaProjects/ChatBox/Chatbox/.objs/server.o
   --   -L/Users/jacksonchen/Desktop/AdaProjects/ChatBox/Chatbox/.objs/
   --   -L/Users/jacksonchen/Desktop/AdaProjects/ChatBox/Chatbox/.objs/
   --   -L/opt/gcc-11.1.0/lib/gcc/x86_64-apple-darwin15/11.1.0/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
