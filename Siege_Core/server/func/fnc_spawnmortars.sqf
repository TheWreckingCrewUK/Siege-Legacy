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

if (mortarcount < 1) exitwith {};

//commented out because ace's ammo handling system is breaking this and also they keep falling over for no reason
//systemchat "spawning mortar";

	mortarcount = mortarcount - 1;
	publicvariable "mortarcount";
//Spawning mortar
_group = createGroup East;
_spawnPos = [_pos,[100,100],random 360,0,[0,100]] call SHK_pos;
//for "_i" from 1 to _total do{

_mortartruck = "RHS_Ural_Open_Civ_01" createvehicle _spawnPos; _mortar = "Rhs_2b14_82mm_ins" createvehicle _spawnPos; _mortar attachto [_mortartruck, [-0.053,-2.7,0.6]]; _box = "ACE_Box_82mm_Mo_HE" createvehicle _spawnPos; _box attachto [_mortartruck, [0.45,-0.1,0]];

	_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), _spawnPos,[], 0.3,"NONE"];


	//the get in code is commented out because an ace update broke the firing function	
		_unit moveIngunner _mortar;
	
	
	twc_currentenemy=twc_currentenemy+1;
	publicVariable "twc_currentenemy";
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		twc_currentenemy=twc_currentenemy-1;
		publicVariable "twc_currentenemy";
		["TWC_Insurgency_adjustPoints", 1] call CBA_fnc_serverEvent;
		
	}];
	/*
group _unit addwaypoint [getmarkerpos "base", 300] call CBA_fnc_randPos;
group _unit addwaypoint [getmarkerpos "base", 50] call CBA_fnc_randPos;
group _unit addwaypoint [getmarkerpos "base", 50] call CBA_fnc_randPos;
group _unit addwaypoint [getmarkerpos "base", 10] call CBA_fnc_randPos;
	*/
	sleep 120 + (random 300);
	while {true} do {
	_mortar setvehicleammo 1;
	sleep 10+ (random 300);
	
		/*
	_unit doArtilleryFire [[getmarkerpos "base", 300] call CBA_fnc_randPos, "8Rnd_82mm_Mo_shells", 5];
 */
	          _wp1 = group _unit addWaypoint [[getmarkerpos "base", 30] call CBA_fnc_randPos,200];
               _wp1 setWaypointType "SCRIPTED";
               _wp1 setWaypointScript "A3\functions_f\waypoints\fn_wpArtillery.sqf";
			  sleep 120+ (random 300);
			  /*
			  if (idfon == 0) then {
execVM "Siege_Core\server\sys_basedefence\IDF_Alarm.sqf";

};*/
			   sleep 40;
	
	
	};
	