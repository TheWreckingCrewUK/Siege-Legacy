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

params["_town"];

_pos = getpos _town;
systemchat "defence called";
_spawnPos = [_pos, 50] call CBA_fnc_randPos;
_num = 0;
_group = createGroup East;
//for "_i" from 1 to _total do{

_chance = _town getvariable "active";

_total = (10 * _chance) / (twc_siege_baseside + 1);

if ( _town getvariable "defended" == 1) exitwith {};

_town setVariable ["defended",1];

for "_i" from 1 to _total do{

	_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), [_spawnPos,50] call CBA_fnc_randPos,[], 0.3,"NONE"];
	
		twc_currentdefender=twc_currentdefender+1;
		publicVariable "twc_currentdefender";
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		["TWC_Insurgency_adjustPoints", 1] call CBA_fnc_serverEvent;
		
		twc_currentdefender=twc_currentdefender+1;
		publicVariable "twc_currentdefender";
		
_act = (_town getvariable "active") / 1.1; _town setVariable ["active",_act]; ;
	}];
	_unit addMagazines ["handGrenade",2];
	_unit setVariable ["unitsHome",_spawnpos,false];
	_num = _num + 1;
	sleep 2;
	
	};
//};
_null = [leader _group, leader _group,250] spawn TWC_fnc_Defend;
_group setBehaviour "SAFE";