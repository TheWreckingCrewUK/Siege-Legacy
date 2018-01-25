/*
* Author(s): [TWC] Bosenator | [TWC] jayman
* Hostile Spawner

* Arguments:
* <Array> Position
* <Array> Radus of two numbers to spawn hostiles between.
* <Array> List of units
*
* Return Value:
* <NONE>
*
* Example:
* [getMarkerPos "spawn",[100,200],p1] spawn twc_fnc_spawnAIUnits;
*
* Public: No
*/

//Recieved Parameters
params ["_pos"];

systemchat "spawning mortar";

	mortarcount = mortarcount - 1;
	publicvariable "mortarcount";
//Spawning mortar
_group = createGroup East;
_spawnPos = [_pos,[100,100],random 360,0,[0,100]] call SHK_pos;
//for "_i" from 1 to _total do{

	_vehicle = "CUP_O_2b14_82mm_TK_INS" createVehicle _spawnPos; 
	_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), _spawnPos,[], 0.3,"NONE"];

	//the get in code is commented out because an ace update broke the firing function	
	//	_unit moveIngunner _vehicle;
	
	
	twc_currentenemy=twc_currentenemy+1;
	publicVariable "twc_currentenemy";
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		twc_currentenemy=twc_currentenemy-1;
		publicVariable "twc_currentenemy";
		["TWC_Insurgency_adjustPoints", 1] call CBA_fnc_serverEvent;
		
	}];
	
group _unit addwaypoint [getmarkerpos "base", 300] call CBA_fnc_randPos;
group _unit addwaypoint [getmarkerpos "base", 50] call CBA_fnc_randPos;
group _unit addwaypoint [getmarkerpos "base", 50] call CBA_fnc_randPos;
group _unit addwaypoint [getmarkerpos "base", 10] call CBA_fnc_randPos;
	
	
/*	while {true} do {
	systemchat "prep";
	sleep 10;
	systemchat "firing";
	//_unit doArtilleryFire [[getmarkerpos "base", 300] call CBA_fnc_randPos, "8Rnd_82mm_Mo_shells", 5];
	
	          _wp1 = group _unit addWaypoint [getmarkerpos "base",0];
              // _wp1 waypointAttachVehicle _killUnit;
               _wp1 setWaypointType "SCRIPTED";
               _wp1 setWaypointScript "A3\functions_f\waypoints\fn_wpArtillery.sqf";
			   sleep 20;
	
	
	};
	