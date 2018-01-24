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

_flag = _spawnpos nearEntities [["CUP_C_Skoda_Blue_CIV"], 300] select 0; 

while {twc_currentenemy<(twc_maxenemy+20)} do {
	_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), [_spawnPos,50] call CBA_fnc_randPos,[], 0.3,"NONE"];
	twc_currentenemy=twc_currentenemy+1;
	publicVariable "twc_currentenemy";
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		twc_currentenemy=twc_currentenemy-1;
		publicVariable "twc_currentenemy";
		["TWC_Insurgency_adjustPoints", 1] call CBA_fnc_serverEvent;
_flag = _unit nearEntities [["CUP_C_Skoda_Blue_CIV"], 100] select 0; 
_act = (_flag getvariable "active") / 0.8; _flag setVariable ["active",2]; systemchat format ["%1", _home];
	}];
	_unit addMagazines ["handGrenade",2];
	_unit setVariable ["unitsHome",_spawnpos,false];
	_num = _num + 1;
	sleep 1 + random 1;
	};
//};
_group setFormation "LINE";
_group addwaypoint [_spawnpos, 50] call CBA_fnc_randPos;
_group addwaypoint [_spawnpos, 50] call CBA_fnc_randPos;
_group addwaypoint [_spawnpos, 50] call CBA_fnc_randPos;
_group addwaypoint [_spawnpos, 50] call CBA_fnc_randPos;
_group addwaypoint [_spawnpos, 50] call CBA_fnc_randPos;