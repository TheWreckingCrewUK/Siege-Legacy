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
params ["_town"];
if ((str _town) in defendedtownarray) exitwith {};
_pos = getpos _town;

sleep random 5;


_group = createGroup East;
_spawnPos = [_pos,100, random 360] call SHK_pos;

if(isNil "twc_tankcount") then{
	twc_tankcount = random 3;
};


if(isNil "twc_ifvcount") then{
	twc_ifvcount = 2;
};


if(isNil "twc_apccount") then{
	twc_apccount = 2;
};


if(isNil "twc_infcount") then{
	twc_infcount = 5;
};


if(isNil "twc_aainfcount") then{
	twc_aainfcount = 3;
};

if(isNil "twc_isspawning") then{
	twc_isspawning = 0;
};

/* removing artillery for the moment until I stop them firing on people at really bad times
if(isNil "twc_artycount") then{
	twc_artycount = 3;
};

twc_artycount = twc_artycount * ( 1+ (random 0.5));
*/
twc_artycount = 0;

[_pos] spawn twc_spawnmortars;

//_spawnPos = [(_spawnPos select 0) + 5,(_spawnPos select 1), (_spawnPos select 2)];


{if (count units _x==0) then {deleteGroup _x}} forEach allGroups;
if (twc_currentenemy > twc_maxenemy) exitwith {};

if (twc_isspawning ==1) exitwith {};
[] spawn {twc_isspawning = 1;
sleep 5;
twc_isspawning = 0;
};

//for "_i" from 1 to (ceil((twc_maxenemy - twc_currentenemy) / 16)) do {
for "_i" from 1 to 2 do {
//while {(twc_currentenemy*8)<(twc_maxenemy)} do {



	_spawnPos = [_pos,[0,250],random 360,0] call SHK_pos;
	
	
	_squad = squad call BIS_fnc_selectRandom;
	_group = [_spawnPos, EAST, _squad] call BIS_fnc_spawnGroup;
	{_x addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		twc_currentenemy=twc_currentenemy-1;
		publicVariable "twc_currentenemy";
		["TWC_Insurgency_adjustPoints", 1] call CBA_fnc_serverEvent;
		
	}]} foreach (units _group);
	//_num = _num + 1;
	sleep (2 + random 2);
	twc_currentenemy=twc_currentenemy+ (count units _group);
	publicVariable "twc_currentenemy";
	
	(units _group) allowGetIn true;
	_group setFormation "LINE";
	if (twc_siege_baseside == 0) then {
	for "_i" from 1 to twc_wpcount do {
		_group addwaypoint [[twc_basepos, 100 * twc_roamsize, 300 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos, 0]};
		_group addwaypoint [twc_basepos, 50 * twc_roamsize] call CBA_fnc_randPos;
		_group addwaypoint [twc_basepos, 20 * twc_roamsize] call CBA_fnc_randPos;
		[_group, twc_wpcount+2] setWaypointStatements ["true", "[this, twc_basepos,100] call CBA_fnc_taskDefend"]
	} else
	{ 
		if ((random 2) > 1) then {
			systemchat "chasing";
			_enemy = playableUnits select (floor (random (count playableunits)));

			_group addwaypoint [[getpos _enemy, 100 * twc_roamsize, 300 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos, 0];
			[_group] call twc_fnc_huntergroup;
		} else
		{
			for "_i" from 1 to twc_wpcount do {
				systemchat "base";


				deleteWaypoint [_group, currentwaypoint (_group)];
				_group addwaypoint [[twc_basepos, 100 * twc_roamsize, 300 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos, 0]
				};

			_group addwaypoint [twc_basepos, 20 * twc_roamsize];

			[_group, twc_wpcount + 1] setWaypointStatements ["true", "[this, twc_basepos] call CBA_fnc_taskDefend"]
		}


	};
};
//};
sleep 2;




	if (totalPoints < (pointLimit)) then {
		if (technicals > 0) then {
			if (random 1 > 0.5) then {
				technicals = technicals - 10;
				publicVariable "technicals";
				_group2 = createGroup East;

				_chosencar = enemyTechnical call BIS_fnc_selectRandom;
				_technical = _chosencar createVehicle _spawnPos;
				_technical setVehicleLock "LOCKEDPLAYER";

				_driver = _group2 createUnit ["CUP_O_RU_Crew_EMR", _spawnPos,[], 0.3,"NONE"];
				_gunner = _group2 createUnit ["CUP_O_RU_Crew_EMR", _spawnPos,[], 0.3,"NONE"];
				_driver moveInDriver _technical;
				_gunner moveInGunner _technical;
				_group2 addwaypoint [[twc_basepos, 300 * twc_roamsize, 500 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
				_wp1 = _group2 addwaypoint [[twc_basepos, 200 * twc_roamsize, 400 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
				_group2 addwaypoint [[twc_basepos, 200 * twc_roamsize, 300 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
				_group2 addwaypoint [[twc_basepos, 200 * twc_roamsize, 300 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
				_group2 addwaypoint [[twc_basepos, 200 * twc_roamsize, 300 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
				 [_group, 4] setWaypointType "CYCLE";
				 _wp1 setwaypointstatements ["true", "{this reveal [_x, 3];} foreach allplayers; {_x suppressfor 120} foreach thislist"];
				sleep 2;

				//being excessive with the counting code because sometimes it counts at strange times so technicals ==1 could spawn 2 or more technicals
				technicals = technicals +9;
				publicVariable "technicals";
				waituntil {!alive _gunner};

				_driver moveInGunner _technical;

			};
		};
	};
//sleep 30;
//[_town] spawn twc_spawnAIUnits;