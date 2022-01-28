pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__server.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__server.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E010 : Short_Integer; pragma Import (Ada, E010, "ada__exceptions_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__soft_links_E");
   E027 : Short_Integer; pragma Import (Ada, E027, "system__exception_table_E");
   E029 : Short_Integer; pragma Import (Ada, E029, "system__exceptions_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__soft_links__initialize_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "ada__containers_E");
   E064 : Short_Integer; pragma Import (Ada, E064, "ada__io_exceptions_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "ada__strings_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "ada__strings__utf_encoding_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "gnat_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "interfaces__c_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "interfaces__c__strings_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "system__os_lib_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "ada__tags_E");
   E063 : Short_Integer; pragma Import (Ada, E063, "ada__streams_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "ada__strings__text_output_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "system__file_control_block_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "system__finalization_root_E");
   E061 : Short_Integer; pragma Import (Ada, E061, "ada__finalization_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "system__file_io_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "system__storage_pools_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "system__finalization_masters_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "system__storage_pools__subpools_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__calendar_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__calendar__delays_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "ada__real_time_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "ada__text_io_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "ada__strings__maps_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "ada__strings__unbounded_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "system__pool_global_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "gnat__sockets_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "gnat__sockets__poll_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "gnat__sockets__thin_common_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "gnat__sockets__thin_E");
   E199 : Short_Integer; pragma Import (Ada, E199, "system__tasking__initialization_E");
   E207 : Short_Integer; pragma Import (Ada, E207, "system__tasking__protected_objects_E");
   E209 : Short_Integer; pragma Import (Ada, E209, "system__tasking__protected_objects__entries_E");
   E213 : Short_Integer; pragma Import (Ada, E213, "system__tasking__queuing_E");
   E217 : Short_Integer; pragma Import (Ada, E217, "system__tasking__stages_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E209 := E209 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "gnat__sockets__finalize_body");
      begin
         E131 := E131 - 1;
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "gnat__sockets__finalize_spec");
      begin
         F3;
      end;
      E156 := E156 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__pool_global__finalize_spec");
      begin
         F4;
      end;
      E166 := E166 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "ada__strings__unbounded__finalize_spec");
      begin
         F5;
      end;
      E119 := E119 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "ada__text_io__finalize_spec");
      begin
         F6;
      end;
      E160 := E160 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "system__storage_pools__subpools__finalize_spec");
      begin
         F7;
      end;
      E150 := E150 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "system__finalization_masters__finalize_spec");
      begin
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "system__file_io__finalize_body");
      begin
         E123 := E123 - 1;
         F9;
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
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, True, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, False, True, True, False, False, 
           True, False, False, True, True, True, True, False, 
           False, False, False, False, False, True, True, False, 
           True, True, False, True, True, True, True, False, 
           False, False, False, False, True, False, False, True, 
           False, True, False, False, True, False, True, False, 
           True, False, False, True, True, False, True, True, 
           False, False, True, False, False, True, False, True, 
           True, True, False, False, True, False, True, True, 
           True, False, True, True, False, True, True, True, 
           True, False, False, False, True, False, False, False, 
           False, False, False, True, True, False, False, False),
         Count => (0, 0, 0, 0, 0, 1, 1, 0, 0, 0),
         Unknown => (False, False, False, False, False, False, True, False, False, False));
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
      E058 := E058 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E064 := E064 + 1;
      Ada.Strings'Elab_Spec;
      E112 := E112 + 1;
      Ada.Strings.Utf_Encoding'Elab_Spec;
      E115 := E115 + 1;
      Gnat'Elab_Spec;
      E129 := E129 + 1;
      Interfaces.C'Elab_Spec;
      E055 := E055 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E144 := E144 + 1;
      System.Os_Lib'Elab_Body;
      E125 := E125 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E066 := E066 + 1;
      Ada.Streams'Elab_Spec;
      E063 := E063 + 1;
      Ada.Strings.Text_Output'Elab_Spec;
      E113 := E113 + 1;
      System.File_Control_Block'Elab_Spec;
      E128 := E128 + 1;
      System.Finalization_Root'Elab_Spec;
      E078 := E078 + 1;
      Ada.Finalization'Elab_Spec;
      E061 := E061 + 1;
      System.File_Io'Elab_Body;
      E123 := E123 + 1;
      System.Storage_Pools'Elab_Spec;
      E154 := E154 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E150 := E150 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E160 := E160 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E008 := E008 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E006 := E006 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E082 := E082 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E119 := E119 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E170 := E170 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E166 := E166 + 1;
      System.Pool_Global'Elab_Spec;
      E156 := E156 + 1;
      Gnat.Sockets'Elab_Spec;
      Gnat.Sockets.Thin_Common'Elab_Spec;
      E142 := E142 + 1;
      E136 := E136 + 1;
      Gnat.Sockets'Elab_Body;
      E131 := E131 + 1;
      E134 := E134 + 1;
      System.Tasking.Initialization'Elab_Body;
      E199 := E199 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E207 := E207 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E209 := E209 + 1;
      System.Tasking.Queuing'Elab_Body;
      E213 := E213 + 1;
      System.Tasking.Stages'Elab_Body;
      E217 := E217 + 1;
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
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
