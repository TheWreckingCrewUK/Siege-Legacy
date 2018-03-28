#include "sys_cleanup\init.sqf";
#include "sys_intel\init.sqf";
#include "sys_diary\init.sqf";
#include "sys_forwardBase\init.sqf";
#include "sys_restrict\init.sqf";
#include "sys_score\init.sqf";
#include "sys_player\init.sqf";
#include "func\init.sqf";
#include "sys_basedefence\init.sqf";
"iedRestrictionZone" setMarkerAlpha 0;
[west, 6] call BIS_fnc_respawnTickets;

player addEventHandler ["Killed",{[west, -1] call BIS_fnc_respawnTickets;

if (({isPlayer _x && alive _x} count allUnits)==0) then {
if (getMarkerColor "base" == "") then { 
if ((getMarkerColor "respawn_forwardBase" == "") ) then {"baselost" call BIS_fnc_endMissionServer;};
};
};
}];



/*
player addEventHandler ["Hit", {[] spawn {if !(vehicle player == player) exitwith{};if (stance player == "PRONE") exitwith {};if ((random 1)>1.5) exitwith{}; _this = player; _this setUnconscious true; sleep 0.1; _this setUnconscious false}}]
*/