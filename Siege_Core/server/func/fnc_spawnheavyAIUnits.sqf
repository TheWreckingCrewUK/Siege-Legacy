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

if(isNil "twc_3manvehs") then{
	twc_3manvehs = ["rhs_t80um","rhs_t90a_tv","rhs_t72be_tv","rhs_t72ba_tv"];
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

if (totalPoints > pointLimit) exitwith {};

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
	[leader _group, 1] spawn TWC_fnc_aiscramble;
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

_armourmult = 0;
if (twc_activearmour == 1) then {_armourmult = _armourmult + 0.5};
if (twc_activefst == 1) then {_armourmult = _armourmult + 0.5};
_tankchance = (0.3 + (count allplayers / 15) + _armourmult);

if ((random 1) > _tankchance) exitwith {};
if (technicals == 0) exitwith {};

	if (totalPoints < (pointLimit)) then {
	//if (1 == 1) then {
	
				_airmult = 1;
				_group2 = createGroup East;

				_chosencar = enemyTechnical call BIS_fnc_selectRandom;
				_technical = objnull;
				if (_chosencar iskindof "air") then {
					_airmult = 2;
					_spawnPos = _spawnPos vectoradd [0,0,150];
					_technical = createVehicle [_chosencar, _spawnPos, [], 0, "FLY"];
					if (_chosencar iskindof "plane") then {
						_technical setvelocity [150 * (sin (getdir _technical )), 150 * (cos (getdir _technical )), 0] ;
						_airmult = 3;
					};
					[_technical] spawn {
						params ["_technical"];
						waituntil {(fuel _technical) < 0.9};
						systemchat "going home";
						{deletewaypoint _x} foreach waypoints (group driver _technical);
						{deletewaypoint _x} foreach waypoints (group driver _technical);
						{deletewaypoint _x} foreach waypoints (group driver _technical);
						{deletewaypoint _x} foreach waypoints (group driver _technical);
						{deletewaypoint _x} foreach waypoints (group driver _technical);
						(group driver _technical) addwaypoint [[0,0,0],0,0];
						waituntil {(_technical distance [0,0,0]) < 2000};
						{deletevehicle _x} foreach (units group driver _technical);
						deletevehicle _technical;
					};
						
				} else {
				_spawnPos = _spawnPos vectoradd [0,0,10];
				_technical = _chosencar createVehicle _spawnPos;
				};
				createVehicleCrew _technical;
				sleep 2;
				_technical setVehicleLock "LOCKEDPLAYER";
				_driver = driver _technical;
				_gunner = gunner _technical;
				{_x addEventHandler ["Killed",{
					[(_this select 0)] call twc_fnc_deleteDead;
					twc_currentenemy=twc_currentenemy-1;
					publicVariable "twc_currentenemy";
					["TWC_Insurgency_adjustPoints", 2] call CBA_fnc_serverEvent;
					
				}]} foreach (units group _driver);
				/*_technical addEventHandler ["Fired", {
					[_this select 1, _this select 6, _this select 7] call twc_fnc_gunwalk; }];*/
					
				if (_chosencar in twc_hasaps) then {
					twc_APS_list pushback _technical;
					publicVariable "twc_APS_list";
				};
					
				if (_chosencar in twc_hasnoaps) then {
					twc_nonAPS_list pushback _technical;
					publicVariable "twc_nonAPS_list";
				};
					/*
				} else {
					
					twc_nonAPS_list pushback _technical;
					publicVariable "twc_nonAPS_list";
				};
*/
/*
				_driver = _group2 createUnit ["CUP_O_RU_Crew_EMR", _spawnPos,[], 0.3,"NONE"];
				_gunner = _group2 createUnit ["CUP_O_RU_Crew_EMR", _spawnPos,[], 0.3,"NONE"];
				_driver moveInDriver _technical;
				_gunner moveInGunner _technical;
				if (_technical in twc_3manvehs) then {
					_Commander = _group2 createUnit ["CUP_O_RU_Crew_EMR", _spawnPos,[], 0.3,"NONE"];
					_Commander moveInCommander _technical;
				};
				*/
				_dis = 300 * (_airmult - 1);
				_group2 = group _driver;
				_group2 addwaypoint [[_technical] call twc_fnc_standoffpos,_dis];
				_wp1 = _group2 addwaypoint [[_technical] call twc_fnc_standoffpos,_dis];
				_group2 addwaypoint [[_technical] call twc_fnc_standoffpos,_dis];
				_group2 addwaypoint [[_technical] call twc_fnc_standoffpos,_dis];
				_group2 addwaypoint [[_technical] call twc_fnc_standoffpos,_dis];
				 [_group2, 5] setWaypointType "CYCLE";
				sleep 2;
				_gunner dowatch twc_basepos;
				
				waituntil {!alive _gunner};

				_driver moveInGunner _technical;

		
	};
//sleep 30;
//[_town] spawn twc_spawnAIUnits;