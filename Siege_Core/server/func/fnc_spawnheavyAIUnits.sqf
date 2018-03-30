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


twc_currentenemy = east countside allunits;
publicVariable "twc_currentenemy";

//Spawning hostiles
_group = createGroup East;
_spawnPos = [_pos,100, random 360] call SHK_pos;


_enemycount = (count allunits) - (count playableunits);
//if (_flag getvariable "fighting" == 1) then {systemchat "spawn blocked"} else {
//for "_i" from 1 to _total do{



if(isNil "twc_tankcount") then{
	twc_tankcount = random 3;
};

twc_tankcount = twc_tankcount * ( 1+ (random 0.5));

if(isNil "twc_ifvcount") then{
	twc_ifvcount = 2;
};

twc_ifvcount = twc_ifvcount * ( 1+ (random 0.5));

if(isNil "twc_apccount") then{
	twc_apccount = 2;
};

twc_apccount = twc_apccount * ( 1+ (random 0.5));

if(isNil "twc_infcount") then{
	twc_infcount = 5;
};
twc_infcount = twc_infcount * ( 1+ (random 0.5));


if(isNil "twc_aainfcount") then{
	twc_aainfcount = 3;
};

twc_aainfcount = twc_aainfcount * ( 1+ (random 0.5));
/* removing artillery for the moment until I stop them firing on people at really bad times
if(isNil "twc_artycount") then{
	twc_artycount = 3;
};

twc_artycount = twc_artycount * ( 1+ (random 0.5));
*/
twc_artycount = 0;




_spawnPos = [(_spawnPos select 0) + 5,(_spawnPos select 1), (_spawnPos select 2)];
		
/*
for "_i" from 1 to twc_aainfcount do {
	_spawnPos = [_pos,[200,400],random 360,0] call SHK_pos;
	_group = [_spawnPos, EAST, squadAA] call BIS_fnc_spawnGroup;
	[_group, _spawnPos, 200] call cba_fnc_taskPatrol;
};
for "_i" from 1 to twc_infcount do {
	_spawnPos = [_pos,[0,250],random 360,0] call SHK_pos;
	_group = [_spawnPos, EAST, squad] call BIS_fnc_spawnGroup;
	[_group, _spawnPos, 150,3,false,true] call cba_fnc_taskDefend;
};
for "_i" from 1 to twc_infcount do {
	_spawnPos = [_pos,[200,400],random 360,0] call SHK_pos;
	_group = [_spawnPos, EAST, squad] call BIS_fnc_spawnGroup;
	[_group, _spawnPos, 200] call cba_fnc_taskPatrol;
};


for "_i" from 1 to twc_tankcount do { _pos2= [_pos, 200] call CBA_fnc_randPos;  
	_spawnPos = [_pos2,[400,500],random 360,0,[1,100]] call SHK_pos;
	_tank = tank call BIS_fnc_selectRandom;
	_group = [_spawnPos, EAST, _tank] call BIS_fnc_spawnGroup;
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos; 
[_group, 0] setWaypointCompletionRadius 30; 
[_group, 1] setWaypointCompletionRadius 30; 
[_group, 2] setWaypointCompletionRadius 30; 
[_group, 3] setWaypointCompletionRadius 30; 
[_group, 4] setWaypointCompletionRadius 30; 
[_group, 5] setWaypointCompletionRadius 30;  
 [_group, 5] setWaypointType "CYCLE";
};
for "_i" from 1 to twc_ifvcount do { _pos2= [_pos, 200] call CBA_fnc_randPos;  
	_spawnPos = [_pos2,[400,500],random 360,0,[1,100]] call SHK_pos;
	_ifv = ifv call BIS_fnc_selectRandom;
	_group = [_spawnPos, EAST, _ifv] call BIS_fnc_spawnGroup;
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos; 
[_group, 0] setWaypointCompletionRadius 30; 
[_group, 1] setWaypointCompletionRadius 30; 
[_group, 2] setWaypointCompletionRadius 30; 
[_group, 3] setWaypointCompletionRadius 30; 
[_group, 4] setWaypointCompletionRadius 30; 
[_group, 5] setWaypointCompletionRadius 30;   
 [_group, 5] setWaypointType "CYCLE";
};
for "_i" from 1 to twc_apccount do { _pos2= [_pos, 200] call CBA_fnc_randPos;  
	_spawnPos = [_pos2,[400,500],random 360,0,[1,100]] call SHK_pos;
	_apc = apc call BIS_fnc_selectRandom;
	_group = [_spawnPos, EAST, _apc] call BIS_fnc_spawnGroup;
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;   
[_group, 0] setWaypointCompletionRadius 30; 
[_group, 1] setWaypointCompletionRadius 30; 
[_group, 2] setWaypointCompletionRadius 30; 
[_group, 3] setWaypointCompletionRadius 30; 
[_group, 4] setWaypointCompletionRadius 30; 
[_group, 5] setWaypointCompletionRadius 30;  
 [_group, 5] setWaypointType "CYCLE";
};
for "_i" from 1 to 2 do { _pos2= [_pos, 200] call CBA_fnc_randPos;  
	_spawnPos = [_pos2,[400,500],random 360,0,[1,100]] call SHK_pos;
	_aa = aa call BIS_fnc_selectRandom;
	_group = [_spawnPos, EAST, _aa] call BIS_fnc_spawnGroup;
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 500] call CBA_fnc_randPos;  
[_group, 0] setWaypointCompletionRadius 30; 
[_group, 1] setWaypointCompletionRadius 30; 
[_group, 2] setWaypointCompletionRadius 30; 
[_group, 3] setWaypointCompletionRadius 30; 
[_group, 4] setWaypointCompletionRadius 30; 
[_group, 5] setWaypointCompletionRadius 30; 
 [_group, 5] setWaypointType "CYCLE";
};

if (( count(allPlayers - entities "HeadlessClient_F")) < 8) then {
	if (random 1 > 0.6) then {
 
 _spawnPos = [_pos,[400,500],random 360,0,[1,100]] call SHK_pos;  
 _group = createGroup East;  
 _vehicle = lightheli createVehicle _spawnPos;  
 
 _driver = _group createUnit ["rhs_pilot_combat_heli", _spawnPos,[], 0.3,"NONE"];  
 _gunner = _group createUnit ["rhs_pilot_combat_heli", _spawnPos,[], 0.3,"NONE"];  
  
 _driver moveInDriver _vehicle;  
 _gunner moveInGunner _vehicle;  
 _flyalt = (100 + (0.03* (_spawnpos distance getmarkerpos "respawn_west"))) min 200;
 _vehicle setVehiclePosition [(_spawnpos vectoradd [0,0,_flyalt]), [],0,"FLY"]; 
_vehicle flyInHeight  _flyalt;
 _group addwaypoint [_spawnPos, 1500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 1500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 1500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 1500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 1500] call CBA_fnc_randPos;  
[_group, 0] setWaypointCompletionRadius 30; 
[_group, 1] setWaypointCompletionRadius 30; 
[_group, 2] setWaypointCompletionRadius 30; 
[_group, 3] setWaypointCompletionRadius 30; 
[_group, 4] setWaypointCompletionRadius 30; 
[_group, 5] setWaypointCompletionRadius 30; 
 [_group, 5] setWaypointType "CYCLE";
 }
	};
	
	if (( count(allPlayers - entities "HeadlessClient_F")) > 14) then {
	if (random 1 > 0.6) then {
 
 _spawnPos = [_pos,[400,500],random 360,0,[1,100]] call SHK_pos;  
 _group = createGroup East;  
 _vehicle = heavyheli createVehicle _spawnPos;  
 
 _driver = _group createUnit ["rhs_pilot_combat_heli", _spawnPos,[], 0.3,"NONE"];  
 _gunner = _group createUnit ["rhs_pilot_combat_heli", _spawnPos,[], 0.3,"NONE"];  
  
 _driver moveInDriver _vehicle;  
 _gunner moveInGunner _vehicle;  
 _flyalt = (100 + (0.04* (_spawnpos distance getmarkerpos "respawn_west"))) min 350;
 _vehicle setVehiclePosition [(_spawnpos vectoradd [0,0,_flyalt]), [],0,"FLY"]; 
_vehicle flyInHeight  _flyalt;
 _group addwaypoint [_spawnPos, 1500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 1500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 1500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 1500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 1500] call CBA_fnc_randPos;  
[_group, 0] setWaypointCompletionRadius 30; 
[_group, 1] setWaypointCompletionRadius 30; 
[_group, 2] setWaypointCompletionRadius 30; 
[_group, 3] setWaypointCompletionRadius 30; 
[_group, 4] setWaypointCompletionRadius 30; 
[_group, 5] setWaypointCompletionRadius 30; 
 [_group, 5] setWaypointType "CYCLE";
 }
	};
	
if (_pos distance getmarkerpos "respawn_west" > 5000) then {
	if (( count(allPlayers - entities "HeadlessClient_F")) > 16) then {
	if (random 1 > 0.7) then {
 
 _spawnPos = [_pos,[400,500],random 360,0,[1,100]] call SHK_pos;  
 _group = createGroup East;  
 _jet = jet createVehicle _spawnPos;  
 
 _driver = _group createUnit ["rhs_pilot_combat_heli", _spawnPos,[], 0.3,"NONE"];  
  
 _driver moveInDriver _jet;  
 _flyalt = (150 + (0.06* (_spawnpos distance getmarkerpos "respawn_west"))) min 450;
 _jet setVehiclePosition [(_spawnpos vectoradd [0,0,_flyalt]), [],0,"FLY"]; 
_jet setvelocity [150 * (sin (getdir _jet )), 150 * (cos (getdir _jet )), 0] ; 
_jet flyInHeight  _flyalt;
 _group addwaypoint [_spawnPos, 2500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 2500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 2500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 2500] call CBA_fnc_randPos;  
 _group addwaypoint [_spawnPos, 2500] call CBA_fnc_randPos; 
[_group, 0] setWaypointCompletionRadius 30; 
[_group, 1] setWaypointCompletionRadius 30; 
[_group, 2] setWaypointCompletionRadius 30; 
[_group, 3] setWaypointCompletionRadius 30; 
[_group, 4] setWaypointCompletionRadius 30; 
[_group, 5] setWaypointCompletionRadius 30;  
 [_group, 5] setWaypointType "CYCLE";
 }
	};

};

_artyspawnpos = [_spawnpos, 2000, 5000, 10, 0, 1, 0, [], [_spawnpos, _spawnpos]] call BIS_fnc_findSafePos;
_attemptcount = 0;
while{

 ([_artyspawnpos,1500] call twc_fnc_posNearPlayers) || _artyspawnpos distance2D (getMarkerPos "base") < 1500 
 }do{
_artyspawnpos = [_spawnpos, 1000, 3000, 10, 0, 1, 0, [], [_spawnpos, _spawnpos]] call BIS_fnc_findSafePos;
	_attemptcount = _attemptcount + 1;

if (_attemptcount > 250) exitwith {
};
};

	artyspawn = arty call BIS_fnc_selectRandom;



*/






while {twc_currentenemy<twc_maxenemy} do {

_enemycount = (count allunits) - (count playableunits);


	_spawnPos = [_pos,[0,250],random 360,0] call SHK_pos;
	
	
	_squad = squad call BIS_fnc_selectRandom;
	_group = [_spawnPos, EAST, _squad] call BIS_fnc_spawnGroup;
	twc_currentenemy=twc_currentenemy+ (count _squad);
	publicVariable "twc_currentenemy";
	{_x addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		twc_currentenemy=twc_currentenemy-1;
		publicVariable "twc_currentenemy";
		["TWC_Insurgency_adjustPoints", 1] call CBA_fnc_serverEvent;
		
	}]} foreach (units _group);
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



	if (totalPoints < (pointLimit)) then {
		if (technicals > 0) then {
			if (random 1 > 0.5) then {
		technicals = technicals - 10;
		publicVariable "technicals";
_group2 = createGroup East;

_chosencar = enemyTechnical call BIS_fnc_selectRandom;
_technical = _chosencar createVehicle _spawnPos;

_driver = _group2 createUnit ["CUP_O_RU_Crew_EMR", _spawnPos,[], 0.3,"NONE"];
_gunner = _group2 createUnit ["CUP_O_RU_Crew_EMR", _spawnPos,[], 0.3,"NONE"];
_driver moveInDriver _technical;
_gunner moveInGunner _technical;
_group2 addwaypoint [[twc_basepos, 300 * twc_roamsize, 500 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
_group2 addwaypoint [[twc_basepos, 200 * twc_roamsize, 400 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
_group2 addwaypoint [[twc_basepos, 200 * twc_roamsize, 300 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
_group2 addwaypoint [[twc_basepos, 100 * twc_roamsize, 200 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
_group2 addwaypoint [[twc_basepos, 100 * twc_roamsize, 200 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos,0];
 [_group, 4] setWaypointType "CYCLE";
sleep 2;

//being excessive with the counting code because sometimes it counts at strange times so technicals ==1 could spawn 2 or more technicals
technicals = technicals +9;
publicVariable "technicals";
waituntil {!alive _gunner};

_driver moveInGunner _technical;

		};
		};
	};

