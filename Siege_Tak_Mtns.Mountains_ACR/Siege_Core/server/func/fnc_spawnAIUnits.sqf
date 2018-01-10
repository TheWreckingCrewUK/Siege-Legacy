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
params ["_pos","_groupradius","_thisList"];

//Selects a direction generally oposite of incoming friendlies
_dir = (_thisList select 0) getDir _pos;
_dir1 = _dir - 30;
_dir2 = _dir + 30;

//Calculating total enemies to spawn
_num = 0;
_total = [_pos] call twc_fnc_calculateSpawnAmount;

//Spawning hostiles
_group = createGroup East;
_spawnPos = [_pos,_groupradius,[_dir1,_dir2]] call SHK_pos;
//for "_i" from 1 to _total do{
while {twc_currentenemy<twc_maxenemy} do {
	_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), _spawnPos,[], 5,"NONE"];
	twc_currentenemy=twc_currentenemy+1;
	publicVariable "twc_currentenemy";
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		twc_currentenemy=twc_currentenemy-1;
		publicVariable "twc_currentenemy";
		["TWC_Insurgency_adjustPoints", 1] call CBA_fnc_serverEvent;
		
	}];
	_unit setVariable ["unitsHome",_pos,false];
	//_num = _num + 1;
	sleep random 1;
};
//};
_group setFormation "LINE";
_group addwaypoint [getmarkerpos "base", 300] call CBA_fnc_randPos;
_group addwaypoint [getmarkerpos "base", 50] call CBA_fnc_randPos;
_group addwaypoint [getmarkerpos "base", 50] call CBA_fnc_randPos;
_group addwaypoint [getmarkerpos "base", 10] call CBA_fnc_randPos;