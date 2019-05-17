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

twc_fnc_aps = compile preprocessfilelinenumbers "Siege_Core\client\func\fn_APS.sqf";
twc_news = compile preprocessfilelinenumbers "Siege_Core\client\news.sqf";



_alphaaction = ["SpawnsmallAlphaCreate","TWC News","",{call twc_news},{true}] call ace_interact_menu_fnc_createAction;
["TWC_Item_Public_Base_LOCSTAT",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;

if(isNil "twc_spawnlist") then{
	twc_spawnlist = [];
	publicVariable "twc_spawnlist";
};

if(!(name player in twc_spawnlist)) then {
twc_spawnlist pushback name player;
[west, 3] call BIS_fnc_respawnTickets;
};
cutText ["","Black IN",0.001];
waitUntil {!isNull player};
cutText ["","Black IN",0.001];

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

twc_pubcamo = 500;
twc_firstspawned = 0;

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	
	player setunittrait ["camouflageCoef", twc_pubcamo];
	
	
	twc_lastspawned = time;
	if (twc_firstspawned > 1) exitwith {};
	twc_firstspawned = time;
	twc_serstarttime = time;
	
	player addEventHandler ["GetInMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];
		_vehicle setunittrait ["camouflageCoef", twc_pubcamo];
	}];
}];


if ((!(forcedMap select 0)) && ((forcedMap select 1))) then {player setdamage 1};


player addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	if (_ammo == "rhs_ammo_smaw_SR") exitwith {};
	if ((_ammo isKindOf ["GrenadeCore", configFile >> "CfgAmmo"]) || (_ammo isKindOf ["RocketCore", configFile >> "CfgAmmo"]) || (_ammo isKindOf ["MissileCore", configFile >> "CfgAmmo"]) || (_ammo isKindOf ["G_40mm_Smoke", configFile >> "CfgAmmo"])) then {[_projectile] call twc_fnc_aps};
}];
