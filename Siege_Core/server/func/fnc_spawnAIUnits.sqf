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
	_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), _spawnPos,[], 0.3,"NONE"];
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
	sleep 1 + random 1;
	

};
//};
sleep 1 + random 1;
	if (totalPoints > (pointLimit / 2)) then {
		if (technicals > 0) then {
			if (random 1 > 0.7) then {
		technicals = technicals - 10;
		publicVariable "technicals";
_group2 = createGroup East;

_chosencar = enemyTechnical call BIS_fnc_selectRandom;
_technical = _chosencar createVehicle _spawnPos;

_driver = _group2 createUnit [(townSpawn select (floor random (count townspawn))), _spawnPos,[], 0.3,"NONE"];
_gunner = _group2 createUnit [(townSpawn select (floor random (count townspawn))), _spawnPos,[], 0.3,"NONE"];
_driver moveInDriver _technical;
_gunner moveInGunner _technical;
_group2 addwaypoint [getmarkerpos "base", 400] call CBA_fnc_randPos;
_group2 addwaypoint [getmarkerpos "base", 350] call CBA_fnc_randPos;
_group2 addwaypoint [getmarkerpos "base", 300] call CBA_fnc_randPos;
_group2 addwaypoint [getmarkerpos "base", 300] call CBA_fnc_randPos;
_group2 addwaypoint [getmarkerpos "base", 300] call CBA_fnc_randPos;
_group2 addwaypoint [getmarkerpos "base", 300] call CBA_fnc_randPos;
 [_group, 5] setWaypointType "CYCLE";
sleep 1 + random 1;

//being excessive with the counting code because sometimes it counts at strange times so technicals ==1 could spawn 2 or more technicals
technicals = technicals +9;
publicVariable "technicals";
waituntil {!alive _gunner};

_driver moveInGunner _technical;

		};
		};
	};

_group setFormation "LINE";
_group addwaypoint [getmarkerpos "base", 300] call CBA_fnc_randPos;
_group addwaypoint [getmarkerpos "base", 50] call CBA_fnc_randPos;
_group addwaypoint [getmarkerpos "base", 50] call CBA_fnc_randPos;
_group addwaypoint [getmarkerpos "base", 10] call CBA_fnc_randPos;