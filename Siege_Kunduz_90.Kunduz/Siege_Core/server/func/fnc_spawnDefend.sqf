/*
* Details:
* 
* Creates a enemy squad to defend around a given marker
*
* Required parameters:
*
* 0 - String     Marker name
*
* Example:
*
*["bastam"] spawn twc_SpawnDefend
*
* Author: [TWC] Fakematty / [TWC] Jayman
*/

params["_pos"];
_spawnPos = [_pos, 50] call CBA_fnc_randPos;
_num = 0;
_total = (([_pos] call twc_fnc_calculateSpawnAmount) * 2) max 20;
_group = createGroup East;
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
	_unit addMagazines ["handGrenade",2];
	_unit setVariable ["unitsHome",_pos,false];
	_num = _num + 1;
	sleep 0.2;
	};
//};
_group setFormation "LINE";
_group addwaypoint [getmarkerpos "base", 300] call CBA_fnc_randPos;
_group addwaypoint [getmarkerpos "base", 50] call CBA_fnc_randPos;
_group addwaypoint [getmarkerpos "base", 50] call CBA_fnc_randPos;
_group addwaypoint [getmarkerpos "base", 10] call CBA_fnc_randPos;