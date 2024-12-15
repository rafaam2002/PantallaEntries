pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~p2_2.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~p2_2.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E078 : Short_Integer; pragma Import (Ada, E078, "system__os_lib_E");
   E010 : Short_Integer; pragma Import (Ada, E010, "ada__exceptions_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__soft_links_E");
   E032 : Short_Integer; pragma Import (Ada, E032, "system__exception_table_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "ada__containers_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "ada__io_exceptions_E");
   E039 : Short_Integer; pragma Import (Ada, E039, "ada__numerics_E");
   E060 : Short_Integer; pragma Import (Ada, E060, "ada__strings_E");
   E062 : Short_Integer; pragma Import (Ada, E062, "ada__strings__maps_E");
   E065 : Short_Integer; pragma Import (Ada, E065, "ada__strings__maps__constants_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "interfaces__c_E");
   E033 : Short_Integer; pragma Import (Ada, E033, "system__exceptions_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "system__object_reader_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "system__dwarf_lines_E");
   E022 : Short_Integer; pragma Import (Ada, E022, "system__soft_links__initialize_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "system__traceback__symbolic_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "ada__strings__utf_encoding_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "ada__tags_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "ada__strings__text_buffers_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "interfaces__c__strings_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "ada__streams_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "system__file_control_block_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "system__finalization_root_E");
   E171 : Short_Integer; pragma Import (Ada, E171, "ada__finalization_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "system__file_io_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "system__task_info_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__calendar_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__calendar__delays_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "ada__real_time_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "ada__text_io_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "system__tasking__initialization_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "system__tasking__protected_objects_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "system__tasking__protected_objects__entries_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "system__tasking__queuing_E");
   E206 : Short_Integer; pragma Import (Ada, E206, "system__tasking__stages_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E198 := E198 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F1;
      end;
      E160 := E160 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "ada__text_io__finalize_spec");
      begin
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__file_io__finalize_body");
      begin
         E170 := E170 - 1;
         F3;
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
      WC_Encoding := '8';
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
           False, False, False, False, False, False, False, False, 
           False, False, False, True, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, False, True, True, False, False, 
           False, False, False, True, True, True, True, False, 
           False, False, False, True, False, False, True, True, 
           False, True, True, False, True, True, True, True, 
           False, False, False, False, False, False, True, False, 
           False, True, False, False, False, False, True, False, 
           True, False, True, False, False, True, True, False, 
           False, False, True, False, False, True, False, False, 
           False, True, False, True, True, True, False, False, 
           True, False, True, True, True, False, True, True, 
           False, True, True, True, True, False, False, False, 
           False, False, False, False, False, False, False, True, 
           True, False, False, False),
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
      E032 := E032 + 1;
      Ada.Containers'Elab_Spec;
      E048 := E048 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E074 := E074 + 1;
      Ada.Numerics'Elab_Spec;
      E039 := E039 + 1;
      Ada.Strings'Elab_Spec;
      E060 := E060 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E062 := E062 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E065 := E065 + 1;
      Interfaces.C'Elab_Spec;
      E085 := E085 + 1;
      System.Exceptions'Elab_Spec;
      E033 := E033 + 1;
      System.Object_Reader'Elab_Spec;
      E091 := E091 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E055 := E055 + 1;
      System.Os_Lib'Elab_Body;
      E078 := E078 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E022 := E022 + 1;
      E015 := E015 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E047 := E047 + 1;
      E010 := E010 + 1;
      Ada.Strings.Utf_Encoding'Elab_Spec;
      E146 := E146 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E154 := E154 + 1;
      Ada.Strings.Text_Buffers'Elab_Spec;
      E144 := E144 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E124 := E124 + 1;
      Ada.Streams'Elab_Spec;
      E162 := E162 + 1;
      System.File_Control_Block'Elab_Spec;
      E174 := E174 + 1;
      System.Finalization_Root'Elab_Spec;
      E173 := E173 + 1;
      Ada.Finalization'Elab_Spec;
      E171 := E171 + 1;
      System.File_Io'Elab_Body;
      E170 := E170 + 1;
      System.Task_Info'Elab_Spec;
      E134 := E134 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E008 := E008 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E006 := E006 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E118 := E118 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E160 := E160 + 1;
      System.Tasking.Initialization'Elab_Body;
      E188 := E188 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E196 := E196 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E198 := E198 + 1;
      System.Tasking.Queuing'Elab_Body;
      E202 := E202 + 1;
      System.Tasking.Stages'Elab_Body;
      E206 := E206 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_p2_2");

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
   --   .\ada.o
   --   .\a-charac.o
   --   .\a-chlat1.o
   --   .\a-tasini.o
   --   .\interfac.o
   --   .\system.o
   --   .\s-atoope.o
   --   .\s-flocon.o
   --   .\s-io.o
   --   .\s-parame.o
   --   .\s-crtl.o
   --   .\i-cstrea.o
   --   .\s-restri.o
   --   .\s-spark.o
   --   .\s-spcuop.o
   --   .\s-stoele.o
   --   .\s-stache.o
   --   .\s-strhas.o
   --   .\s-htable.o
   --   .\s-string.o
   --   .\s-traent.o
   --   .\s-unstyp.o
   --   .\s-wchcon.o
   --   .\s-wchjis.o
   --   .\s-wchcnv.o
   --   .\s-conca2.o
   --   .\s-conca3.o
   --   .\s-conca4.o
   --   .\s-conca5.o
   --   .\s-conca9.o
   --   .\s-traceb.o
   --   .\s-excdeb.o
   --   .\s-valuti.o
   --   .\s-valllu.o
   --   .\s-vallli.o
   --   .\s-wchstw.o
   --   .\a-elchha.o
   --   .\a-exctra.o
   --   .\s-addima.o
   --   .\s-bitops.o
   --   .\s-boustr.o
   --   .\s-casuti.o
   --   .\s-exctab.o
   --   .\a-contai.o
   --   .\a-ioexce.o
   --   .\a-numeri.o
   --   .\a-nubinu.o
   --   .\a-string.o
   --   .\a-strmap.o
   --   .\a-stmaco.o
   --   .\i-c.o
   --   .\s-atopri.o
   --   .\s-except.o
   --   .\s-excmac.o
   --   .\s-win32.o
   --   .\a-chahan.o
   --   .\s-aotase.o
   --   .\s-exctra.o
   --   .\s-imgint.o
   --   .\s-imguns.o
   --   .\s-memory.o
   --   .\s-mmosin.o
   --   .\s-mmap.o
   --   .\s-objrea.o
   --   .\s-dwalin.o
   --   .\s-os_lib.o
   --   .\s-secsta.o
   --   .\s-soliin.o
   --   .\s-soflin.o
   --   .\s-stalib.o
   --   .\s-trasym.o
   --   .\a-except.o
   --   .\a-einuoc.o
   --   .\a-stuten.o
   --   .\a-suenst.o
   --   .\a-suewst.o
   --   .\a-suezst.o
   --   .\a-tags.o
   --   .\a-sttebu.o
   --   .\a-stbuut.o
   --   .\i-cstrin.o
   --   .\s-arit64.o
   --   .\s-multip.o
   --   .\s-osinte.o
   --   .\s-intman.o
   --   .\s-putima.o
   --   .\a-stream.o
   --   .\s-ficobl.o
   --   .\s-finroo.o
   --   .\a-finali.o
   --   .\s-fileio.o
   --   .\s-stausa.o
   --   .\s-tasinf.o
   --   .\s-tasloc.o
   --   .\s-taspri.o
   --   .\s-winext.o
   --   .\s-osprim.o
   --   .\s-tasdeb.o
   --   .\s-taprop.o
   --   .\s-taskin.o
   --   .\a-calend.o
   --   .\a-caldel.o
   --   .\a-reatim.o
   --   .\a-retide.o
   --   .\a-textio.o
   --   .\s-exnlli.o
   --   .\s-imguti.o
   --   .\s-imfi64.o
   --   .\s-solita.o
   --   .\s-tataat.o
   --   .\s-tasini.o
   --   .\s-taprob.o
   --   .\s-tpoben.o
   --   .\s-tasque.o
   --   .\s-tasuti.o
   --   .\s-tpobop.o
   --   .\s-taenca.o
   --   .\s-tasren.o
   --   .\s-tassta.o
   --   .\p2_2.o
   --   -L.\
   --   -LC:/Users/Rafa/AppData/Local/alire/cache/toolchains/gnat_native_14.2.1_2540cccb/lib/gcc/x86_64-w64-mingw32/14.2.0/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
