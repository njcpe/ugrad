set_global_assignment -entity "PLLnew" -library "lib_PLLnew" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "PLLnew" -library "lib_PLLnew" -name IP_TOOL_VERSION "16.0"
set_global_assignment -entity "PLLnew" -library "lib_PLLnew" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_PLLnew" -name SPD_FILE [file join $::quartus(sip_path) "PLLnew.spd"]

set_global_assignment -library "lib_PLLnew" -name MISC_FILE [file join $::quartus(sip_path) "PLLnew_sim/PLLnew.vho"]
