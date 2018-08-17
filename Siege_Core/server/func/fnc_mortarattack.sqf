/*
* Author(s): [TWC] Hobbs
* Mortar Spawner

* Arguments:
* <Array> Position
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
params ["_mortar"];

waituntil {(count twc_mortar_targetlist) > 0};
waituntil {twc_mortar_baseclear == 1};

_targetpos = twc_mortar_targetlist select 0;
 if (!(typeName _param == "ARRAY")) then {_targetpos = getpos _targetpos};
sleep (1 + random 30);

_total = 3 +(random 7);

if ((_mortar distance _targetpos) > 4000) exitwith {};

_mortar setvehicleammodef 1;

_mortar lookat (_targetpos);

for "_i" from 1 to _total do {

	_mortar doArtilleryFire [[_targetpos,150] call cba_fnc_randpos, currentmagazine _mortar, 1];

	sleep (4 + random 3);

}; 

twc_mortar_targetlist deleteAt 0;
publicVariable "twc_mortar_targetlist";

_mortar lookat objnull;

_mortar setvehicleammodef 0;

sleep (1 + random 30);

[_mortar] spawn twc_mortarattack;

if ((random 1) > 0.8) then {twc_mortar_targetlist pushback _targetpos; publicVariable "twc_mortar_targetlist"};