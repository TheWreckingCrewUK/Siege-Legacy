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

if (totalPoints > pointLimit) exitwith {};

if(isNil "twc_isspawning") then{
	twc_isspawning = 0;
};
//Recieved Parameters
params ["_town"];
if ((str _town) in defendedtownarray) exitwith {};
_pos = getpos _town;

if (twc_heavymode == 1) exitwith{[_town] call twc_spawnheavyAIUnits};

//systemchat "spawn";

//Spawning hostiles


sleep random 5;

{if (count units _x==0) then {deleteGroup _x}} forEach allGroups;
if (twc_currentenemy > twc_maxenemy) exitwith {};

//systemchat format ["spawn %1", _spawnPos];
if (twc_isspawning ==1) exitwith {};
[] spawn {twc_isspawning = 1;
sleep 5;
twc_isspawning = 0;
};


_group = createGroup East;
//while {twc_currentenemy<twc_maxenemy} do {
for "_i" from 1 to (3 +(random 8)) do {


_spawnPos = [_pos,100, random 360] call SHK_pos;
	_unit = _group createUnit [(selectRandom townSpawn), _spawnPos, [], 5, "NONE"];
	twc_currentenemy=twc_currentenemy+1;
	publicVariable "twc_currentenemy";
	//systemchat format ["spawn %1", _unit];
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		twc_currentenemy=twc_currentenemy-1;
		publicVariable "twc_currentenemy";
		["TWC_Insurgency_adjustPoints", 1] call CBA_fnc_serverEvent;
		
	}];
	
	//_num = _num + 1;
	

};
//};

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

[_group, twc_wpcount + 1] setWaypointStatements ["true", "[this, twc_basepos] call CBA_fnc_taskDefend"];
}


};


_armourmult = 1;
if (twc_activearmour == 1) then {_armourmult = 1.5 + (twc_maxenemy / 160)};
if (twc_activefst == 1) then {_armourmult = _armourmult + 0.4};

	//if (totalPoints > (pointLimit / 2)) then {
		if ((technicals > 0) || (_armourmult > 1.5)) then {
			if (random 1 > 0.3) then {
			systemchat "technical";
		technicals = technicals - 10;
		publicVariable "technicals";
_group2 = createGroup East;
_spawnPos = [_pos,100, random 360] call SHK_pos;

_chosencar = enemyTechnical call BIS_fnc_selectRandom;
_technical = _chosencar createVehicle _spawnPos;

_driver = _group2 createUnit [(townSpawn select (floor random (count townspawn))), _spawnPos,[], 0.3,"NONE"];
_gunner = _group2 createUnit [(townSpawn select (floor random (count townspawn))), _spawnPos,[], 0.3,"NONE"];
_driver moveInDriver _technical;
_gunner moveInGunner _technical;


if (_chosencar in twc_hasaps) then {
	twc_APS_list pushback _technical;
	publicVariable "twc_APS_list";
};


/*_technical addEventHandler ["Fired", {
[_this select 1, _this select 6, _this select 7] call twc_fnc_gunwalk; }];*/
_group2 addwaypoint [[twc_basepos, 300 * twc_roamsize, 500 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
_group2 addwaypoint [[twc_basepos, 200 * twc_roamsize, 400 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
_group2 addwaypoint [[twc_basepos, 100 * twc_roamsize, 300 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
_group2 addwaypoint [[twc_basepos, 100 * twc_roamsize, 200 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
_group2 addwaypoint [twc_basepos, 100 * twc_roamsize] call CBA_fnc_randPos;
_group2 addwaypoint [twc_basepos, 100 * twc_roamsize] call CBA_fnc_randPos;
 [_group, 5] setWaypointType "CYCLE";
 
//being excessive with the counting code because sometimes it counts at strange times so technicals ==1 could spawn 2 or more technicals
technicals = technicals +9;
publicVariable "technicals";
waituntil {!alive _gunner};

_driver moveInGunner _technical;

		};
		} else {systemchat "no 1";};
//	};

