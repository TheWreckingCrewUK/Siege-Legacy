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


systemchat format ["spawn %1", _pos];


//Spawning hostiles
_group = createGroup East;
_spawnPos = [_pos,100, random 360] call SHK_pos;


_enemycount = (count allunits) - (count playableunits);
//if (_flag getvariable "fighting" == 1) then {systemchat "spawn blocked"} else {
//for "_i" from 1 to _total do{


while {_enemycount<twc_maxenemy} do {

_enemycount = (count allunits) - (count playableunits);
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
	sleep 2;

};
//};
sleep 2;

_group setFormation "LINE";
if (twc_siege_baseside == 0) then {
for "_i" from 1 to twc_wpcount do {
_group addwaypoint [[twc_basepos, 100 * twc_roamsize, 300 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos, 0]};
_group addwaypoint [twc_basepos, 50 * twc_roamsize] call CBA_fnc_randPos;
_group addwaypoint [twc_basepos, 20 * twc_roamsize] call CBA_fnc_randPos;
[_group, twc_wpcount+2] setWaypointStatements ["true", "[this, twc_basepos,100] call CBA_fnc_taskDefend"]
} else
{ if ((random 2) > 1) then {
systemchat "chasing";
_enemy = playableUnits select (floor (random (count playableunits)));

_group addwaypoint [[getpos _enemy, 100 * twc_roamsize, 300 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos, 0];
[_group] call twc_fnc_huntergroup;
} else
{
for "_i" from 1 to twc_wpcount do {
systemchat "base";


deleteWaypoint [_group, currentwaypoint (_group)];
_group addwaypoint [[twc_basepos, 100 * twc_roamsize, 300 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos, 0]};

_group addwaypoint [twc_basepos, 20 * twc_roamsize];

[_group, twc_wpcount + 1] setWaypointStatements ["true", "[this, twc_basepos] call CBA_fnc_taskDefend"]
}


};



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
_group2 addwaypoint [[twc_basepos, 300 * twc_roamsize, 500 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
_group2 addwaypoint [[twc_basepos, 200 * twc_roamsize, 400 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
_group2 addwaypoint [[twc_basepos, 100 * twc_roamsize, 300 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
_group2 addwaypoint [[twc_basepos, 100 * twc_roamsize, 200 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
_group2 addwaypoint [twc_basepos, 100 * twc_roamsize] call CBA_fnc_randPos;
_group2 addwaypoint [twc_basepos, 100 * twc_roamsize] call CBA_fnc_randPos;
 [_group, 5] setWaypointType "CYCLE";
sleep 2;

//being excessive with the counting code because sometimes it counts at strange times so technicals ==1 could spawn 2 or more technicals
technicals = technicals +9;
publicVariable "technicals";
waituntil {!alive _gunner};

_driver moveInGunner _technical;

		};
		};
	};

