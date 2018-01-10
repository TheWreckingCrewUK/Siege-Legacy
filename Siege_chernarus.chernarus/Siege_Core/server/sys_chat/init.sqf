twc_fnc_giveUp = compile preprocessFileLineNumbers "siege_core\server\sys_chat\fnc_giveUp.sqf";

["giveup",{player setVariable ["wantingSurrender",true,true]; [] remoteExec ["twc_fnc_giveUp",2]},"all"] call CBA_fnc_registerChatCommand;