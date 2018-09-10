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


if(isNil "twc_spawnlist") then{
	twc_spawnlist = [];
	publicVariable "twc_spawnlist";
};

if(!(name player in twc_spawnlist)) then {
twc_spawnlist pushback name player;
[west, 3] call BIS_fnc_respawnTickets;
};

player addEventHandler ["Killed",{
	[west, -1] call BIS_fnc_respawnTickets;

	if (({isPlayer _x && alive _x} count allUnits)==0) then {
		if (getMarkerColor "base" == "") then {
			if ((getMarkerColor "respawn_forwardBase" == "") ) then {
				"baselost" call BIS_fnc_endMissionServer;
			};
		};
	};

	_globalTickets = [missionNamespace] call BIS_fnc_respawnTickets;
	if (_globalTickets == 0) then {"tickets" call BIS_fnc_endMissionServer;};
}];

sleep 60;

_forceMapForced = forcedMap select 0;
_openMapForced = forcedMap select 1;
if (_forceMapForced || _openMapForced) then {player setdamage 1; [west, 1] call BIS_fnc_respawnTickets;};


/*
player addEventHandler ["Hit", {[] spawn {if !(vehicle player == player) exitwith{};if (stance player == "PRONE") exitwith {};if ((random 1)>1.5) exitwith{}; _this = player; _this setUnconscious true; sleep 0.1; _this setUnconscious false}}]
*/