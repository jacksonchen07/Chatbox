pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 11.1.0" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_client" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#c18cd662#;
   pragma Export (C, u00001, "clientB");
   u00002 : constant Version_32 := 16#66132de6#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#5fb136c1#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00005, "ada__charactersS");
   u00006 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00006, "ada__characters__latin_1S");
   u00007 : constant Version_32 := 16#27bde6b3#;
   pragma Export (C, u00007, "ada__exceptionsB");
   u00008 : constant Version_32 := 16#023400c0#;
   pragma Export (C, u00008, "ada__exceptionsS");
   u00009 : constant Version_32 := 16#51b6c352#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   u00010 : constant Version_32 := 16#2c60dc9e#;
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   u00011 : constant Version_32 := 16#5e074051#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#adf22619#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#c2be0dca#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#bca68eac#;
   pragma Export (C, u00014, "system__secondary_stackB");
   u00015 : constant Version_32 := 16#afac77d5#;
   pragma Export (C, u00015, "system__secondary_stackS");
   u00016 : constant Version_32 := 16#896564a3#;
   pragma Export (C, u00016, "system__parametersB");
   u00017 : constant Version_32 := 16#1955849a#;
   pragma Export (C, u00017, "system__parametersS");
   u00018 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00018, "system__storage_elementsB");
   u00019 : constant Version_32 := 16#73c40a55#;
   pragma Export (C, u00019, "system__storage_elementsS");
   u00020 : constant Version_32 := 16#ce3e0e21#;
   pragma Export (C, u00020, "system__soft_links__initializeB");
   u00021 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00021, "system__soft_links__initializeS");
   u00022 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00022, "system__stack_checkingB");
   u00023 : constant Version_32 := 16#d0b82bb9#;
   pragma Export (C, u00023, "system__stack_checkingS");
   u00024 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00024, "system__exception_tableB");
   u00025 : constant Version_32 := 16#053941ac#;
   pragma Export (C, u00025, "system__exception_tableS");
   u00026 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00026, "system__exceptionsB");
   u00027 : constant Version_32 := 16#36642da7#;
   pragma Export (C, u00027, "system__exceptionsS");
   u00028 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00028, "system__exceptions__machineB");
   u00029 : constant Version_32 := 16#bff81f32#;
   pragma Export (C, u00029, "system__exceptions__machineS");
   u00030 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00030, "system__exceptions_debugB");
   u00031 : constant Version_32 := 16#261dd12a#;
   pragma Export (C, u00031, "system__exceptions_debugS");
   u00032 : constant Version_32 := 16#ee8e331a#;
   pragma Export (C, u00032, "system__img_intS");
   u00033 : constant Version_32 := 16#01838199#;
   pragma Export (C, u00033, "system__tracebackB");
   u00034 : constant Version_32 := 16#1e8ab60a#;
   pragma Export (C, u00034, "system__tracebackS");
   u00035 : constant Version_32 := 16#1f08c83e#;
   pragma Export (C, u00035, "system__traceback_entriesB");
   u00036 : constant Version_32 := 16#78af9330#;
   pragma Export (C, u00036, "system__traceback_entriesS");
   u00037 : constant Version_32 := 16#a0281f47#;
   pragma Export (C, u00037, "system__traceback__symbolicB");
   u00038 : constant Version_32 := 16#9fa412cf#;
   pragma Export (C, u00038, "system__traceback__symbolicS");
   u00039 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00039, "ada__exceptions__tracebackB");
   u00040 : constant Version_32 := 16#6b52f2d4#;
   pragma Export (C, u00040, "ada__exceptions__tracebackS");
   u00041 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00041, "system__address_imageB");
   u00042 : constant Version_32 := 16#ffebdd6b#;
   pragma Export (C, u00042, "system__address_imageS");
   u00043 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00043, "system__wch_conB");
   u00044 : constant Version_32 := 16#457a6283#;
   pragma Export (C, u00044, "system__wch_conS");
   u00045 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00045, "system__wch_stwB");
   u00046 : constant Version_32 := 16#686b4e82#;
   pragma Export (C, u00046, "system__wch_stwS");
   u00047 : constant Version_32 := 16#1f681dab#;
   pragma Export (C, u00047, "system__wch_cnvB");
   u00048 : constant Version_32 := 16#4acdd870#;
   pragma Export (C, u00048, "system__wch_cnvS");
   u00049 : constant Version_32 := 16#edec285f#;
   pragma Export (C, u00049, "interfacesS");
   u00050 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00050, "system__wch_jisB");
   u00051 : constant Version_32 := 16#cabdc151#;
   pragma Export (C, u00051, "system__wch_jisS");
   u00052 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00052, "ada__integer_text_ioB");
   u00053 : constant Version_32 := 16#2ec7c168#;
   pragma Export (C, u00053, "ada__integer_text_ioS");
   u00054 : constant Version_32 := 16#f4e097a7#;
   pragma Export (C, u00054, "ada__text_ioB");
   u00055 : constant Version_32 := 16#6f4fff7c#;
   pragma Export (C, u00055, "ada__text_ioS");
   u00056 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00056, "ada__streamsB");
   u00057 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00057, "ada__streamsS");
   u00058 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00058, "ada__io_exceptionsS");
   u00059 : constant Version_32 := 16#630374d7#;
   pragma Export (C, u00059, "ada__tagsB");
   u00060 : constant Version_32 := 16#cb8ac80c#;
   pragma Export (C, u00060, "ada__tagsS");
   u00061 : constant Version_32 := 16#796f31f1#;
   pragma Export (C, u00061, "system__htableB");
   u00062 : constant Version_32 := 16#dac5f3bb#;
   pragma Export (C, u00062, "system__htableS");
   u00063 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00063, "system__string_hashB");
   u00064 : constant Version_32 := 16#789b98c5#;
   pragma Export (C, u00064, "system__string_hashS");
   u00065 : constant Version_32 := 16#b0a0120c#;
   pragma Export (C, u00065, "system__unsigned_typesS");
   u00066 : constant Version_32 := 16#ad224df6#;
   pragma Export (C, u00066, "system__val_lluS");
   u00067 : constant Version_32 := 16#269742a9#;
   pragma Export (C, u00067, "system__val_utilB");
   u00068 : constant Version_32 := 16#f2a7f6af#;
   pragma Export (C, u00068, "system__val_utilS");
   u00069 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00069, "system__case_utilB");
   u00070 : constant Version_32 := 16#61d2f605#;
   pragma Export (C, u00070, "system__case_utilS");
   u00071 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00071, "interfaces__c_streamsB");
   u00072 : constant Version_32 := 16#066a78a0#;
   pragma Export (C, u00072, "interfaces__c_streamsS");
   u00073 : constant Version_32 := 16#17ee5feb#;
   pragma Export (C, u00073, "system__crtlS");
   u00074 : constant Version_32 := 16#d88b6b5e#;
   pragma Export (C, u00074, "system__file_ioB");
   u00075 : constant Version_32 := 16#f976a134#;
   pragma Export (C, u00075, "system__file_ioS");
   u00076 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00076, "ada__finalizationS");
   u00077 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00077, "system__finalization_rootB");
   u00078 : constant Version_32 := 16#11f533c1#;
   pragma Export (C, u00078, "system__finalization_rootS");
   u00079 : constant Version_32 := 16#bda8f5b3#;
   pragma Export (C, u00079, "system__os_libB");
   u00080 : constant Version_32 := 16#d872da39#;
   pragma Export (C, u00080, "system__os_libS");
   u00081 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00081, "system__stringsB");
   u00082 : constant Version_32 := 16#3e116cc4#;
   pragma Export (C, u00082, "system__stringsS");
   u00083 : constant Version_32 := 16#a398daf9#;
   pragma Export (C, u00083, "system__file_control_blockS");
   u00084 : constant Version_32 := 16#7a00bb28#;
   pragma Export (C, u00084, "ada__text_io__generic_auxB");
   u00085 : constant Version_32 := 16#48b7189e#;
   pragma Export (C, u00085, "ada__text_io__generic_auxS");
   u00086 : constant Version_32 := 16#837deeab#;
   pragma Export (C, u00086, "system__img_biuS");
   u00087 : constant Version_32 := 16#ce232975#;
   pragma Export (C, u00087, "system__img_llbS");
   u00088 : constant Version_32 := 16#641b1f09#;
   pragma Export (C, u00088, "system__img_lliS");
   u00089 : constant Version_32 := 16#b9d2dc07#;
   pragma Export (C, u00089, "system__img_lllbS");
   u00090 : constant Version_32 := 16#0fcb1af1#;
   pragma Export (C, u00090, "system__img_llliS");
   u00091 : constant Version_32 := 16#b3a6c50b#;
   pragma Export (C, u00091, "system__img_lllwS");
   u00092 : constant Version_32 := 16#92115c7e#;
   pragma Export (C, u00092, "system__img_llwS");
   u00093 : constant Version_32 := 16#bca75599#;
   pragma Export (C, u00093, "system__img_wiuS");
   u00094 : constant Version_32 := 16#1a16db40#;
   pragma Export (C, u00094, "system__val_intS");
   u00095 : constant Version_32 := 16#11e86aa4#;
   pragma Export (C, u00095, "system__val_unsS");
   u00096 : constant Version_32 := 16#4647b756#;
   pragma Export (C, u00096, "system__val_lliS");
   u00097 : constant Version_32 := 16#57234a9b#;
   pragma Export (C, u00097, "system__val_llliS");
   u00098 : constant Version_32 := 16#4c79b15d#;
   pragma Export (C, u00098, "system__val_llluS");
   u00099 : constant Version_32 := 16#d81f5edf#;
   pragma Export (C, u00099, "ada__real_timeB");
   u00100 : constant Version_32 := 16#1ad7dfc0#;
   pragma Export (C, u00100, "ada__real_timeS");
   u00101 : constant Version_32 := 16#df59ed75#;
   pragma Export (C, u00101, "system__taskingB");
   u00102 : constant Version_32 := 16#8b9ca23f#;
   pragma Export (C, u00102, "system__taskingS");
   u00103 : constant Version_32 := 16#117c7cf1#;
   pragma Export (C, u00103, "system__task_primitivesS");
   u00104 : constant Version_32 := 16#026f4b42#;
   pragma Export (C, u00104, "system__os_interfaceB");
   u00105 : constant Version_32 := 16#ac067ae3#;
   pragma Export (C, u00105, "system__os_interfaceS");
   u00106 : constant Version_32 := 16#e49bce3e#;
   pragma Export (C, u00106, "interfaces__cB");
   u00107 : constant Version_32 := 16#6c9a16d7#;
   pragma Export (C, u00107, "interfaces__cS");
   u00108 : constant Version_32 := 16#b872dcbc#;
   pragma Export (C, u00108, "interfaces__c__extensionsS");
   u00109 : constant Version_32 := 16#adb5d7a4#;
   pragma Export (C, u00109, "system__os_constantsS");
   u00110 : constant Version_32 := 16#1be0e881#;
   pragma Export (C, u00110, "system__task_primitives__operationsB");
   u00111 : constant Version_32 := 16#ee3defd4#;
   pragma Export (C, u00111, "system__task_primitives__operationsS");
   u00112 : constant Version_32 := 16#89b55e64#;
   pragma Export (C, u00112, "system__interrupt_managementB");
   u00113 : constant Version_32 := 16#de2a0953#;
   pragma Export (C, u00113, "system__interrupt_managementS");
   u00114 : constant Version_32 := 16#64507e17#;
   pragma Export (C, u00114, "system__multiprocessorsB");
   u00115 : constant Version_32 := 16#66abdf22#;
   pragma Export (C, u00115, "system__multiprocessorsS");
   u00116 : constant Version_32 := 16#2b2125d3#;
   pragma Export (C, u00116, "system__os_primitivesB");
   u00117 : constant Version_32 := 16#59fa25a7#;
   pragma Export (C, u00117, "system__os_primitivesS");
   u00118 : constant Version_32 := 16#e0fce7f8#;
   pragma Export (C, u00118, "system__task_infoB");
   u00119 : constant Version_32 := 16#de1dfd50#;
   pragma Export (C, u00119, "system__task_infoS");
   u00120 : constant Version_32 := 16#396952b5#;
   pragma Export (C, u00120, "system__tasking__debugB");
   u00121 : constant Version_32 := 16#de1ac8b1#;
   pragma Export (C, u00121, "system__tasking__debugS");
   u00122 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00122, "system__concat_2B");
   u00123 : constant Version_32 := 16#5ca79781#;
   pragma Export (C, u00123, "system__concat_2S");
   u00124 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00124, "system__concat_3B");
   u00125 : constant Version_32 := 16#55771cf4#;
   pragma Export (C, u00125, "system__concat_3S");
   u00126 : constant Version_32 := 16#25460443#;
   pragma Export (C, u00126, "system__img_enum_newB");
   u00127 : constant Version_32 := 16#3f4b4691#;
   pragma Export (C, u00127, "system__img_enum_newS");
   u00128 : constant Version_32 := 16#617d5887#;
   pragma Export (C, u00128, "system__stack_usageB");
   u00129 : constant Version_32 := 16#8d63b971#;
   pragma Export (C, u00129, "system__stack_usageS");
   u00130 : constant Version_32 := 16#20ec7aa3#;
   pragma Export (C, u00130, "system__ioB");
   u00131 : constant Version_32 := 16#c045b71e#;
   pragma Export (C, u00131, "system__ioS");
   u00132 : constant Version_32 := 16#b5988c27#;
   pragma Export (C, u00132, "gnatS");
   u00133 : constant Version_32 := 16#bb066e6e#;
   pragma Export (C, u00133, "gnat__socketsB");
   u00134 : constant Version_32 := 16#b5f1edd4#;
   pragma Export (C, u00134, "gnat__socketsS");
   u00135 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00135, "ada__containersS");
   u00136 : constant Version_32 := 16#dc3f038c#;
   pragma Export (C, u00136, "gnat__sockets__linker_optionsS");
   u00137 : constant Version_32 := 16#c066048c#;
   pragma Export (C, u00137, "gnat__sockets__pollB");
   u00138 : constant Version_32 := 16#fb64b932#;
   pragma Export (C, u00138, "gnat__sockets__pollS");
   u00139 : constant Version_32 := 16#57c21ad4#;
   pragma Export (C, u00139, "ada__calendarB");
   u00140 : constant Version_32 := 16#31350a81#;
   pragma Export (C, u00140, "ada__calendarS");
   u00141 : constant Version_32 := 16#5e4565d7#;
   pragma Export (C, u00141, "gnat__sockets__thinB");
   u00142 : constant Version_32 := 16#d99add37#;
   pragma Export (C, u00142, "gnat__sockets__thinS");
   u00143 : constant Version_32 := 16#ffaa9e94#;
   pragma Export (C, u00143, "ada__calendar__delaysB");
   u00144 : constant Version_32 := 16#d86d2f1d#;
   pragma Export (C, u00144, "ada__calendar__delaysS");
   u00145 : constant Version_32 := 16#efb85c8a#;
   pragma Export (C, u00145, "gnat__os_libS");
   u00146 : constant Version_32 := 16#485b8267#;
   pragma Export (C, u00146, "gnat__task_lockS");
   u00147 : constant Version_32 := 16#05c60a38#;
   pragma Export (C, u00147, "system__task_lockB");
   u00148 : constant Version_32 := 16#3f8d773f#;
   pragma Export (C, u00148, "system__task_lockS");
   u00149 : constant Version_32 := 16#01d87a0e#;
   pragma Export (C, u00149, "gnat__sockets__thin_commonB");
   u00150 : constant Version_32 := 16#fb36919c#;
   pragma Export (C, u00150, "gnat__sockets__thin_commonS");
   u00151 : constant Version_32 := 16#71c4423e#;
   pragma Export (C, u00151, "interfaces__c__stringsB");
   u00152 : constant Version_32 := 16#f239f79c#;
   pragma Export (C, u00152, "interfaces__c__stringsS");
   u00153 : constant Version_32 := 16#2f9cb76c#;
   pragma Export (C, u00153, "system__arith_64B");
   u00154 : constant Version_32 := 16#ec63babe#;
   pragma Export (C, u00154, "system__arith_64S");
   u00155 : constant Version_32 := 16#5de653db#;
   pragma Export (C, u00155, "system__communicationB");
   u00156 : constant Version_32 := 16#47671583#;
   pragma Export (C, u00156, "system__communicationS");
   u00157 : constant Version_32 := 16#1a7f835c#;
   pragma Export (C, u00157, "system__finalization_mastersB");
   u00158 : constant Version_32 := 16#3fc57c4e#;
   pragma Export (C, u00158, "system__finalization_mastersS");
   u00159 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00159, "system__img_boolB");
   u00160 : constant Version_32 := 16#abde31ba#;
   pragma Export (C, u00160, "system__img_boolS");
   u00161 : constant Version_32 := 16#35d6ef80#;
   pragma Export (C, u00161, "system__storage_poolsB");
   u00162 : constant Version_32 := 16#2571a7e6#;
   pragma Export (C, u00162, "system__storage_poolsS");
   u00163 : constant Version_32 := 16#021224f8#;
   pragma Export (C, u00163, "system__pool_globalB");
   u00164 : constant Version_32 := 16#29da5924#;
   pragma Export (C, u00164, "system__pool_globalS");
   u00165 : constant Version_32 := 16#eca5ecae#;
   pragma Export (C, u00165, "system__memoryB");
   u00166 : constant Version_32 := 16#077a2665#;
   pragma Export (C, u00166, "system__memoryS");
   u00167 : constant Version_32 := 16#5e8f3fa6#;
   pragma Export (C, u00167, "system__storage_pools__subpoolsB");
   u00168 : constant Version_32 := 16#8393ab70#;
   pragma Export (C, u00168, "system__storage_pools__subpoolsS");
   u00169 : constant Version_32 := 16#e6a15ecd#;
   pragma Export (C, u00169, "system__storage_pools__subpools__finalizationB");
   u00170 : constant Version_32 := 16#8bd8fdc9#;
   pragma Export (C, u00170, "system__storage_pools__subpools__finalizationS");
   u00171 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00171, "ada__stringsS");
   u00172 : constant Version_32 := 16#45d85488#;
   pragma Export (C, u00172, "ada__strings__unboundedB");
   u00173 : constant Version_32 := 16#e3f69850#;
   pragma Export (C, u00173, "ada__strings__unboundedS");
   u00174 : constant Version_32 := 16#cadb5da7#;
   pragma Export (C, u00174, "ada__strings__searchB");
   u00175 : constant Version_32 := 16#73987e07#;
   pragma Export (C, u00175, "ada__strings__searchS");
   u00176 : constant Version_32 := 16#24ece25f#;
   pragma Export (C, u00176, "ada__strings__mapsB");
   u00177 : constant Version_32 := 16#ac61938c#;
   pragma Export (C, u00177, "ada__strings__mapsS");
   u00178 : constant Version_32 := 16#7919b3ca#;
   pragma Export (C, u00178, "system__bit_opsB");
   u00179 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00179, "system__bit_opsS");
   u00180 : constant Version_32 := 16#e6eadae6#;
   pragma Export (C, u00180, "ada__strings__text_outputS");
   u00181 : constant Version_32 := 16#cd3494c7#;
   pragma Export (C, u00181, "ada__strings__utf_encodingB");
   u00182 : constant Version_32 := 16#37e3917d#;
   pragma Export (C, u00182, "ada__strings__utf_encodingS");
   u00183 : constant Version_32 := 16#c2b98963#;
   pragma Export (C, u00183, "ada__strings__utf_encoding__wide_wide_stringsB");
   u00184 : constant Version_32 := 16#91eda35b#;
   pragma Export (C, u00184, "ada__strings__utf_encoding__wide_wide_stringsS");
   u00185 : constant Version_32 := 16#a1d6147d#;
   pragma Export (C, u00185, "system__compare_array_unsigned_8B");
   u00186 : constant Version_32 := 16#f70431dc#;
   pragma Export (C, u00186, "system__compare_array_unsigned_8S");
   u00187 : constant Version_32 := 16#a8025f3c#;
   pragma Export (C, u00187, "system__address_operationsB");
   u00188 : constant Version_32 := 16#4d0bfe62#;
   pragma Export (C, u00188, "system__address_operationsS");
   u00189 : constant Version_32 := 16#b2ec367e#;
   pragma Export (C, u00189, "system__put_imagesB");
   u00190 : constant Version_32 := 16#0326efad#;
   pragma Export (C, u00190, "system__put_imagesS");
   u00191 : constant Version_32 := 16#1ce84679#;
   pragma Export (C, u00191, "ada__strings__text_output__utilsB");
   u00192 : constant Version_32 := 16#3780fb9b#;
   pragma Export (C, u00192, "ada__strings__text_output__utilsS");
   u00193 : constant Version_32 := 16#020a3f4d#;
   pragma Export (C, u00193, "system__atomic_countersB");
   u00194 : constant Version_32 := 16#ea5b6ddc#;
   pragma Export (C, u00194, "system__atomic_countersS");
   u00195 : constant Version_32 := 16#c9a3fcbc#;
   pragma Export (C, u00195, "system__stream_attributesB");
   u00196 : constant Version_32 := 16#84e17e14#;
   pragma Export (C, u00196, "system__stream_attributesS");
   u00197 : constant Version_32 := 16#3e25f63c#;
   pragma Export (C, u00197, "system__stream_attributes__xdrB");
   u00198 : constant Version_32 := 16#ce9a2a0c#;
   pragma Export (C, u00198, "system__stream_attributes__xdrS");
   u00199 : constant Version_32 := 16#9d359f3d#;
   pragma Export (C, u00199, "system__fat_fltS");
   u00200 : constant Version_32 := 16#bb079630#;
   pragma Export (C, u00200, "system__fat_lfltS");
   u00201 : constant Version_32 := 16#c1d738da#;
   pragma Export (C, u00201, "system__fat_llfS");
   u00202 : constant Version_32 := 16#04c41270#;
   pragma Export (C, u00202, "system__strings__stream_opsB");
   u00203 : constant Version_32 := 16#ec029138#;
   pragma Export (C, u00203, "system__strings__stream_opsS");
   u00204 : constant Version_32 := 16#f6426077#;
   pragma Export (C, u00204, "system__tasking__rendezvousB");
   u00205 : constant Version_32 := 16#0ab0962f#;
   pragma Export (C, u00205, "system__tasking__rendezvousS");
   u00206 : constant Version_32 := 16#100eaf58#;
   pragma Export (C, u00206, "system__restrictionsB");
   u00207 : constant Version_32 := 16#00ed53d6#;
   pragma Export (C, u00207, "system__restrictionsS");
   u00208 : constant Version_32 := 16#c1f64448#;
   pragma Export (C, u00208, "system__tasking__entry_callsB");
   u00209 : constant Version_32 := 16#526fb901#;
   pragma Export (C, u00209, "system__tasking__entry_callsS");
   u00210 : constant Version_32 := 16#ae3eeeea#;
   pragma Export (C, u00210, "system__tasking__initializationB");
   u00211 : constant Version_32 := 16#cd0eb8a9#;
   pragma Export (C, u00211, "system__tasking__initializationS");
   u00212 : constant Version_32 := 16#b71b5649#;
   pragma Export (C, u00212, "system__soft_links__taskingB");
   u00213 : constant Version_32 := 16#e939497e#;
   pragma Export (C, u00213, "system__soft_links__taskingS");
   u00214 : constant Version_32 := 16#3880736e#;
   pragma Export (C, u00214, "ada__exceptions__is_null_occurrenceB");
   u00215 : constant Version_32 := 16#8c52dfdf#;
   pragma Export (C, u00215, "ada__exceptions__is_null_occurrenceS");
   u00216 : constant Version_32 := 16#5abddd2e#;
   pragma Export (C, u00216, "system__tasking__task_attributesB");
   u00217 : constant Version_32 := 16#7dbadc03#;
   pragma Export (C, u00217, "system__tasking__task_attributesS");
   u00218 : constant Version_32 := 16#e59967af#;
   pragma Export (C, u00218, "system__tasking__protected_objectsB");
   u00219 : constant Version_32 := 16#242da0e0#;
   pragma Export (C, u00219, "system__tasking__protected_objectsS");
   u00220 : constant Version_32 := 16#9cbea778#;
   pragma Export (C, u00220, "system__tasking__protected_objects__entriesB");
   u00221 : constant Version_32 := 16#7daf93e7#;
   pragma Export (C, u00221, "system__tasking__protected_objects__entriesS");
   u00222 : constant Version_32 := 16#54bfb6fa#;
   pragma Export (C, u00222, "system__tasking__protected_objects__operationsB");
   u00223 : constant Version_32 := 16#d7b32435#;
   pragma Export (C, u00223, "system__tasking__protected_objects__operationsS");
   u00224 : constant Version_32 := 16#5617ed70#;
   pragma Export (C, u00224, "system__tasking__queuingB");
   u00225 : constant Version_32 := 16#73e13001#;
   pragma Export (C, u00225, "system__tasking__queuingS");
   u00226 : constant Version_32 := 16#7e68a212#;
   pragma Export (C, u00226, "system__tasking__utilitiesB");
   u00227 : constant Version_32 := 16#8488e202#;
   pragma Export (C, u00227, "system__tasking__utilitiesS");
   u00228 : constant Version_32 := 16#4dbda5ab#;
   pragma Export (C, u00228, "system__tasking__stagesB");
   u00229 : constant Version_32 := 16#81567080#;
   pragma Export (C, u00229, "system__tasking__stagesS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_lli%s
   --  system.img_llli%s
   --  system.io%s
   --  system.io%b
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_llb%s
   --  system.img_lllb%s
   --  system.img_lllw%s
   --  system.img_llw%s
   --  system.img_wiu%s
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.memory%s
   --  system.memory%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  ada.containers%s
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.utf_encoding%s
   --  ada.strings.utf_encoding%b
   --  ada.strings.utf_encoding.wide_wide_strings%s
   --  ada.strings.utf_encoding.wide_wide_strings%b
   --  gnat%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  interfaces.c.extensions%s
   --  interfaces.c.strings%s
   --  interfaces.c.strings%b
   --  system.arith_64%s
   --  system.arith_64%b
   --  system.case_util%s
   --  system.case_util%b
   --  system.fat_flt%s
   --  system.fat_lflt%s
   --  system.fat_llf%s
   --  system.multiprocessors%s
   --  system.multiprocessors%b
   --  system.os_constants%s
   --  system.os_interface%s
   --  system.os_interface%b
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  system.os_lib%s
   --  system.os_lib%b
   --  gnat.os_lib%s
   --  system.task_lock%s
   --  system.task_lock%b
   --  gnat.task_lock%s
   --  system.task_primitives%s
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%b
   --  system.tasking%b
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_lllu%s
   --  system.val_llli%s
   --  system.val_llu%s
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  ada.strings.text_output%s
   --  ada.strings.text_output.utils%s
   --  ada.strings.text_output.utils%b
   --  system.communication%s
   --  system.communication%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.put_images%s
   --  system.put_images%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.storage_pools.subpools%b
   --  system.stream_attributes%s
   --  system.stream_attributes.xdr%s
   --  system.stream_attributes.xdr%b
   --  system.stream_attributes%b
   --  system.val_lli%s
   --  system.val_uns%s
   --  system.val_int%s
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.delays%s
   --  ada.calendar.delays%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  gnat.sockets%s
   --  gnat.sockets.linker_options%s
   --  gnat.sockets.poll%s
   --  gnat.sockets.thin_common%s
   --  gnat.sockets.thin_common%b
   --  gnat.sockets.thin%s
   --  gnat.sockets.thin%b
   --  gnat.sockets%b
   --  gnat.sockets.poll%b
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.strings.stream_ops%s
   --  system.strings.stream_ops%b
   --  system.tasking.initialization%s
   --  system.tasking.task_attributes%s
   --  system.tasking.task_attributes%b
   --  system.tasking.initialization%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%s
   --  system.tasking.utilities%b
   --  system.tasking.entry_calls%s
   --  system.tasking.rendezvous%s
   --  system.tasking.protected_objects.operations%s
   --  system.tasking.protected_objects.operations%b
   --  system.tasking.entry_calls%b
   --  system.tasking.rendezvous%b
   --  system.tasking.stages%s
   --  system.tasking.stages%b
   --  client%b
   --  END ELABORATION ORDER

end ada_main;
